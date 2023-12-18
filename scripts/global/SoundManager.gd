extends Node

var preview_playing = false
var track_select_last_pos = 0.0

const track_tscn = preload("res://scenes/global/Tracks.tscn")

var track_dict_090
var track_dict_100
var track_dict_110

func _ready():
	var tracks = Tracks.get_children()
	track_dict_090 = {
		"spacedive" : fetch_track("spacedive_090"),
		"breeze" : fetch_track("breeze_090"),
		"coy_glance" : fetch_track("coy_glance_090"),
		"brighter" : fetch_track("brighter_090"),
		"baroque" : fetch_track("baroque_090"),
		"strato" : fetch_track("strato_090"),
		"devilcat" : fetch_track("devilcat_090"),
		"moonlight" : fetch_track("moonlight_090"),
		"scarlet" : fetch_track("scarlet_090"),
		"musashi" : fetch_track("musashi_090"),
		"isle" : fetch_track("isle_090"),
		"kraken" : fetch_track("kraken_090"),
		"cirrus" : fetch_track("cirrus_090"),
	}
	track_dict_100 = {
		"spacedive" : fetch_track("spacedive_100"),
		"breeze" : fetch_track("breeze_100"),
		"coy_glance" : fetch_track("coy_glance_100"),
		"brighter" : fetch_track("brighter_100"),
		"baroque" : fetch_track("baroque_100"),
		"strato" : fetch_track("strato_100"),
		"devilcat" : fetch_track("devilcat_100"),
		"moonlight" : fetch_track("moonlight_100"),
		"scarlet" : fetch_track("scarlet_100"),
		"musashi" : fetch_track("musashi_100"),
		"isle" : fetch_track("isle_100"),
		"kraken" : fetch_track("kraken_100"),
		"cirrus" : fetch_track("cirrus_100"),
	}
	track_dict_110 = {
		"spacedive" : fetch_track("spacedive_110"),
		"breeze" : fetch_track("breeze_110"),
		"coy_glance" : fetch_track("coy_glance_110"),
		"brighter" : fetch_track("brighter_110"),
		"baroque" : fetch_track("baroque_110"),
		"strato" : fetch_track("strato_110"),
		"devilcat" : fetch_track("devilcat_110"),
		"moonlight" : fetch_track("moonlight_110"),
		"scarlet" : fetch_track("scarlet_110"),
		"musashi" : fetch_track("musashi_110"),
		"isle" : fetch_track("isle_110"),
		"kraken" : fetch_track("kraken_110"),
		"cirrus" : fetch_track("cirrus_110"),
	}

func fetch_track(target_audio):
	var tracks = Tracks.get_children()
	for t in tracks:
		if t.name == target_audio:
			return t
	return null

func fetch_audio_stream(target_audio):
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == target_audio:
			return s
	return null

func play_sound(target_audio):
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == target_audio:
			s.volume_db = UserPreferences.prefs["SFX_vol"]
			# Exceptions (BGMs + others ...)
			if s.name == "flair1":
				if UserPreferences.prefs["disable_combo_SFX"] == true:
					return
			if s.name == "title_track":
				s.volume_db = UserPreferences.prefs["music_vol"]
			if s.name == "track_select":
				s.volume_db = UserPreferences.prefs["music_vol"] - 2
			s.play()

func stop_sound(target_audio):
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == target_audio:
			s.stop()

func play_combo(pitch):
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "combo":
			if !UserPreferences.prefs["disable_combo_SFX"]:
				s.volume_db = UserPreferences.prefs["SFX_vol"]
				s.pitch_scale = pitch
				s.play()
