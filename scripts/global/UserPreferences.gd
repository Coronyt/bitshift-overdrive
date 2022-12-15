extends Node

const PREF_PATH = "res://config.cfg"

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
	var load_cfg = pref_cfg.load(PREF_PATH)
	if load_cfg != OK:
		print("No user preferences detected, generating config.cfg ...")
		save_prefs()
	else:
		print("User preferences detected, loading from config.cfg ...")
		load_prefs()

func save_prefs():
	for pref_key in prefs.keys():
		pref_cfg.set_value("UserPreferences", pref_key, prefs[pref_key])
	pref_cfg.save(PREF_PATH)

func load_prefs():
	for pref_key in prefs.keys():
		UserPreferences.prefs[pref_key] = pref_cfg.get_value("UserPreferences", pref_key, null)
