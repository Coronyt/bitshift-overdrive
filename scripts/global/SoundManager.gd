extends Node

var preview_playing = false
var track_select_last_pos = 0.0

const track_tscn = preload("res://scenes/global/Tracks.tscn")

var track_dict_075
var track_dict_100
var track_dict_125

func _ready():
	var tracks = Tracks.get_children()
	track_dict_075 = {
		"spacedive" : fetch_track("supermassive_spacedive_075"),
		"breezy" : fetch_track("breeze_in_the_blackest_forest_075"),
		"feelingcoy" : fetch_track("coy_glance_075"),
		"brightside" : fetch_track("on_the_other_side_075"),
		"bachjam" : fetch_track("bitshift_baroque_075"),
		"stratofly" : fetch_track("catch_the_stratosphere_075"),
	}
	track_dict_100 = {
		"spacedive" : fetch_track("supermassive_spacedive_100"),
		"breezy" : fetch_track("breeze_in_the_blackest_forest_100"),
		"feelingcoy" : fetch_track("coy_glance_100"),
		"brightside" : fetch_track("on_the_other_side_100"),
		"bachjam" : fetch_track("bitshift_baroque_100"),
		"stratofly" : fetch_track("catch_the_stratosphere_100"),
	}
	track_dict_125 = {
		"spacedive" : fetch_track("supermassive_spacedive_125"),
		"breezy" : fetch_track("breeze_in_the_blackest_forest_125"),
		"feelingcoy" : fetch_track("coy_glance_125"),
		"brightside" : fetch_track("on_the_other_side_125"),
		"bachjam" : fetch_track("bitshift_baroque_125"),
		"stratofly" : fetch_track("catch_the_stratosphere_125"),
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
			# Exceptions (BGMs)
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
			s.volume_db = UserPreferences.prefs["SFX_vol"]
			s.pitch_scale = pitch
			s.play()
