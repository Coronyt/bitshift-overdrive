extends Node

var chart_name = ""

# Last used modifiers.
var mod_dif_1 = ""
var mod_dif_2 = ""
var mod_speed = ""

# Currently active modifiers.
var is_075 = false
var is_090 = false
var is_110 = false
var is_125 = false
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
var final_db

func _ready():
	final_db = UserPreferences.prefs["music_vol"] - 2
	mod_dif_1 = UserPreferences.prefs["diff_1"]
	mod_dif_2 = UserPreferences.prefs["diff_2"]
	mod_speed = UserPreferences.prefs["speed"]
	if UserPreferences.prefs["full"]:
		OS.window_fullscreen = true

func refresh():
	is_075 = false
	is_090 = false
	is_110 = false
	is_125 = false
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
