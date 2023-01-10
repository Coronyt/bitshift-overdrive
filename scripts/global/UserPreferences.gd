extends Node

const PREF_PATH = "res://config.cfg"

var pref_cfg = ConfigFile.new()
var prefs = {
	"disable_screen_curve":		false,
	"disable_visualizer":		false,
	"disable_scrolling":		false,
	"disable_tooltips":			false,
	"paddle_drag":				0.0,
	"master_vol":				0.0, # 0.0 to -30.0
	"music_vol":				0.0, # 0.0 to -30.0
	"SFX_vol":					0.0, # 0.0 to -30.0
	"diff_1":					"underclock",
	"diff_2":					"classic",
	"speed":					"speed_100",
	"full":						false,
}

func _ready():
	# Loading preferences
	var load_cfg = pref_cfg.load(PREF_PATH)
	if load_cfg != OK:
		print("No user preferences detected, generating config.cfg ...")
		save_prefs()
	else:
		print("User preferences detected, loading from config.cfg ...")
		load_prefs()
	# Activating preferences
	# Volume settings
	var bus = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus, UserPreferences.prefs["master_vol"])
	print("Master bus levels at " + str(AudioServer.get_bus_volume_db(bus)))
	if UserPreferences.prefs["master_vol"] == -30.0:
		AudioServer.set_bus_mute(bus, true)

func save_prefs():
	for pref_key in prefs.keys():
		pref_cfg.set_value("UserPreferences", pref_key, prefs[pref_key])
	pref_cfg.save(PREF_PATH)

func load_prefs():
	for pref_key in prefs.keys():
		UserPreferences.prefs[pref_key] = pref_cfg.get_value("UserPreferences", pref_key, null)
