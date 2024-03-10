extends Node

const note = preload("res://scenes/objects/Note.tscn")
onready var NoteLight = preload("res://scenes/objects/NoteLight.tscn")

var start = false
var chart = []

export(float) var offset_1 = 0 # Note spawn time offset.
export(float) var offset_2 = 0 # Note spawn pos. offset.
var speed_mult_1 = 1.00
var speed_mult_2 = 1.00

export var BPM = 0
var quarter = 0.0
var last_note = 0.0
var curr_note = 0

func fetch_speed():
	if Active.speed == "speed_090":
		speed_mult_1 = 0.90
		speed_mult_2 = 1.10
	if Active.speed == "speed_110":
		speed_mult_1 = 1.10
		speed_mult_2 = 0.90

func spawn_note(axis):
	if self.get_parent().cinematic == false:
		var new_note = note.instance()
		new_note.global_position = Vector2(axis, self.get_parent().paddle_pos_y - offset_2)
		self.get_parent().get_child(1).add_child(new_note)
		var note_light = NoteLight.instance()
		new_note.add_child(note_light)

func _ready():
	fetch_speed()
	chart = ChartManager.fetch_chart(Active.chart)
	quarter = float(60) / (float(BPM) * speed_mult_1)
	# len_total = Active.track_ref.stream.get_length()
	curr_note = chart[index][1]

var index = 0

# onready var len_total = self.get_parent().len_total # Active.track_ref.stream.get_length()
# var this_prog_bar = self.get_parent().get_child
# onready var this_prog_bar = self.get_parent().this_prog_bar

func _physics_process(_delta):
	if start == false:
		index += 1
		start = true
	elif Active.track_ref != null:
		var since : float = (last_note + quarter * float(4) / float(curr_note)) - offset_1 * speed_mult_2
		if Active.track_ref.get_playback_position() > since:
			if chart[index][0] == "NOTE":
				spawn_note(chart[index][2])
				last_note += quarter * float(4) / float(curr_note)
				curr_note = chart[index][1]
				index += 1
			elif chart[index][0] == "REST":
				last_note += quarter * float(4) / float(curr_note)
				curr_note = chart[index][1]
				index += 1
			elif chart[index][0] == "END":
				if self.get_parent().cinematic == false:
					self.get_parent().play_fade_anim()
		var curr_pos = Active.track_ref.get_playback_position()
		# var len_total = Active.track_ref.stream.get_length()
		#Active.progress = curr_pos / len_total
		var this_prog_bar = self.get_parent().this_prog_bar
		var len_total = self.get_parent().len_total
		this_prog_bar.value = curr_pos / len_total
		# var this_prog = curr_pos / len_total
		# pseudo:
			# get var reference to this scene's progress bar
			# call func in the progress bar, pass this_prog as arg
			# move stuff out of physics_process() func into new function
		# var this_prog_bar = self.get_parent()
		# pseudo:
			# just had another idea ...
			# the timestamps of the progress milestones are relative to song length
				# so they should never change ... and they'll always be close enough
			# so i should calculate the progress milestone timestamps for each song
				# make an dict matching each song and speed to respective timestamp tuples
				# how to calculate progress milestone for each track?
					# have an aux func for this ... calc same way it is now
						# when track is opened it will print to console and i will log manually
						# do this for all tracks!
							# okay nevermind doing it manually would suck
							# so just calculate them during chart.gd ready() func
							# and then ... yeah just set timers based on that !!!
								# this should work fine ^^^
			# ready function on each chart will load the respective timestamps
			# can use timer node to count distance between milestones
				# this also a good primer for the non physics_process chartcore alg.

onready var this_miletimer = $MileTimer
var quarter_mile

func track_milestones():
	# Calculating quarter of track length
	# var len_total = Active.track_ref.stream.get_length()
	var len_total = self.get_parent().len_total
	quarter_mile = len_total / 4.0
	# Setting and starting milestone timer
	this_miletimer.wait_time = quarter_mile
	print("quarter_mile = " + str(quarter_mile))
	this_miletimer.start()

var local_miles = 0

func _on_MilestoneTimer_timeout():
	var this_prog_bar = self.get_parent().this_prog_bar
	if local_miles == 0: # Just reached 25%
		this_prog_bar.mile_25()
	elif local_miles == 1: # Just reached 50%
		this_prog_bar.mile_50()
	elif local_miles == 2: # Just reached 75%
		this_prog_bar.mile_75()
	local_miles += 1
