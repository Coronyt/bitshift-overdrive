extends Node

var chart_name = ""

# Last used modifiers.
var mod_speed = "SpeedButton2"
var mod_dif_1 = "DifButton1"
var mod_dif_2 = "DifButton3"

# Currently active modifiers.
var is_slow = false
var is_fast = false
var is_easy = false
var is_byte = false
var is_nybl = false
var is_iron = false

# Active chart parameters.
var chart = ""
var active = []
var speed = 0
var score = 0

var combo = 0
var combo_LR = false
var last_milestone = 0

var health = 0
var progress = 0.0
var track_ref : AudioStreamPlayer = null

var diff_desc = ""

func refresh():
	is_slow = false
	is_fast = false
	is_easy = false
	is_byte = false
	is_nybl = false
	is_iron = false
	chart = ""
	active = []
	health = 0
	speed = 0
	score = 0
	combo = 0
	last_milestone = 0
	track_ref = null
	diff_desc = ""
