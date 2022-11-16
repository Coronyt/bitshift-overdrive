extends Node

const PREF_PATH = "res://prefs.cfg"

var pref_cfg = ConfigFile.new()
var prefs = {
	"disable_screen_curve":		false,
	"disable_visualizer":		false,
	"disable_scrolling":		false,
	"disable_tooltips":			false,
	"paddle_drag":				0.0,
	"master_vol":				100.0,
	"SFX_vol":					100.0,
}

func _ready():
	save_prefs()
	load_prefs()

func save_prefs():
	for pref_key in prefs.keys():
		pref_cfg.set_value("UserPreferences", pref_key, prefs[pref_key])
	pref_cfg.save(PREF_PATH)

func load_prefs():
	pass
