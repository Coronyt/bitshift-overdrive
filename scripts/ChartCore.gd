extends Node

const note = preload("res://scenes/objects/Note.tscn")
onready var NoteLight = preload("res://scenes/objects/NoteLight.tscn")

var start = false
var chart = []

var parent : Node2D

export(float) var offset_1 = 0 # Note spawn time offset.
export(float) var offset_2 = 0 # Note spawn pos. offset.
var speed_mult_1 = 1.00
var speed_mult_2 = 1.00

export var BPM = 0
var quarter = 0.0
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
	var new_note = note.instance()
	new_note.global_position = Vector2(axis, self.get_parent().paddle_pos_y - offset_2)
	self.get_parent().get_child(1).add_child(new_note)
	var note_light = NoteLight.instance()
	new_note.add_child(note_light)
	new_note.note_speed = speed

func _ready():
	fetch_speed()
	chart = ChartManager.fetch_chart(Active.chart)
	quarter = float(60) / (float(BPM) * speed_mult_1)
	curr_note = chart[index][1]
	parent = self.get_parent()

var index = 1
var since : float
var curr_len : float

var stream
var next_pos = 0.0
var stream_cached = false

var curr_pos : float
var len_total : float

var this_prog_bar : TextureProgress

func _physics_process(_delta):
	if Active.track_ref != null:
		if not stream_cached:
			stream = Active.track_ref
			stream_cached = true
			len_total = self.get_parent().len_total
			this_prog_bar = self.get_parent().this_prog_bar
		if stream.get_playback_position() > since:
			if chart[index][0] != "END":
				if chart[index][0] == "NOTE":
					spawn_note(chart[index][2])
				last_note += quarter * float(4) / float(curr_note)
				curr_note = chart[index][1]
				index += 1
				since()
			else: self.get_parent().play_fade_anim()
		if not parent.paused:
			curr_pos = Active.track_ref.get_playback_position()
			this_prog_bar.value = curr_pos / len_total

func since():
	since = (last_note + quarter * float(4) / float(curr_note)) - offset_1 * speed_mult_2

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
