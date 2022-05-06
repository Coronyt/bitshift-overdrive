extends Node

# Last used modifiers.
var mod_speed = "SpeedButton2"
var mod_dif_1 = "DifButton1"
var mod_dif_2 = "DifButton3"

# Currently active modifiers.
var is_slow = false
var is_fast = false
var is_easy = false
var is_iron = false

# Active chart parameters.
var chart = ""
var active = []
var speed = 0
var score = 0

var track_ref : AudioStreamPlayer = null

func refresh():
	is_slow = false
	is_fast = false
	is_easy = false
	is_iron = false
	chart = ""
	active = []
	speed = 0
	score = 0
	track_ref = null

func clear():
	for a in active:
		if is_instance_valid(a) == true:
			a.fade()
			pass
