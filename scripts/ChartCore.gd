extends Node

const note = preload("res://scenes/objects/Note.tscn")

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
	if Active.speed == "SpeedButton1":
		speed_mult_1 = 0.75
		speed_mult_2 = 1.25
	if Active.speed == "SpeedButton3":
		speed_mult_1 = 1.25
		speed_mult_2 = 0.75

func spawn_note(axis):
	if self.get_parent().cinematic == false:
		var new_note = note.instance()
		new_note.global_position = Vector2(axis, self.get_parent().paddle_pos_y - offset_2)
		# new_note.get_child(1).play(Active.chart)
		self.get_parent().get_child(1).add_child(new_note)

func _ready():
	fetch_speed()
	chart = ChartManager.fetch_chart(Active.chart)
	quarter = float(60) / (float(BPM) * speed_mult_1)
	curr_note = chart[index][1]

var index = 0

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
