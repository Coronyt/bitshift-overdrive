extends Node

const note = preload("res://scenes/objects/Note.tscn")
onready var NoteLight = preload("res://scenes/objects/NoteLight.tscn")

var start = false
var chart = []

export(float) var offset_1 = 0 # Note spawn time offset.
export(float) var offset_2 = 0 # Note spawn pos. offset.
var speed_mult_1 = 1.00
var speed_mult_2 = 1.00

var local_dict = {}
export var BPM = 0

var quarter_note = 0.0
var last_note = 0.0
var curr_note = 0

var speed = 0.0

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
		new_note.note_speed = speed

func _ready():
	fetch_speed()
	chart = ChartManager.fetch_chart(Active.chart)
	quarter_note = float(60) / (float(BPM) * speed_mult_1)
	# Initializing note lengths from BPM
	local_dict[1] = quarter_note * 4.0
	local_dict[2] = quarter_note * 2.0
	local_dict[4] = quarter_note
	local_dict[8] = quarter_note / 2.0
	local_dict[16] = quarter_note / 4.0
	local_dict[32] = quarter_note / 8.0
	curr_note = chart[index][1]
	# Applying offset_1 to local DelayTimer
	# $DelayTimer.wait_time = offset_1 * speed_mult_2

var index = 1
var this_note_len

func chart_core_cycle():
	this_note_len = local_dict[chart[index][1]]
	if chart[index][0] == "NOTE":
		print("cc_cycle just read a " + chart[index][0] + " ...")
		print("Spawning a note on " + str(chart[index][2]) + " ...")
		spawn_note(chart[index][2])
		curr_note = chart[index][1]
	elif chart[index][0] == "REST":
		print("cc_cycle just read a " + chart[index][0] + " ...")
		print("Waiting for " + str(this_note_len) + " seconds ...")
		curr_note = chart[index][1]
	elif chart[index][0] == "END":
		print("cc_cycle just read a " + chart[index][0] + " ...")
		self.get_parent().play_fade_anim()
	$CoreTimer.wait_time = this_note_len
	$CoreTimer.start()
	index += 1

var curr_pos
var len_total
var this_prog_bar

func _physics_process(_delta):
	# TODO - Refactor the below code
	if self.get_parent().tracking:
		curr_pos = Active.track_ref.get_playback_position()
		this_prog_bar = self.get_parent().this_prog_bar
		len_total = self.get_parent().len_total
		this_prog_bar.value = curr_pos / len_total

onready var this_miletimer = $MileTimer
var quarter_mile

func track_milestones():
	var len_total = self.get_parent().len_total
	quarter_mile = len_total / 4.0
	this_miletimer.wait_time = quarter_mile
	this_miletimer.start()

var local_miles = 0

func _on_MileTimer_timeout():
	var this_prog_bar = self.get_parent().this_prog_bar
	if local_miles == 0: # Just reached 25 %
		this_prog_bar.mile_25()
	elif local_miles == 1: # Just reached 50 %
		this_prog_bar.mile_50()
	elif local_miles == 2: # Just reached 75 %
		this_prog_bar.mile_75()
	local_miles += 1
