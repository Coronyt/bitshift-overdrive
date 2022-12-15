extends Node

var preview_playing = false
var track_select_last_pos = 0.0

const track_tscn = preload("res://scenes/global/Tracks.tscn")

var track_dict_075 = {
	"Track_1" : Tracks.get_child(0),
	"Track_2" : Tracks.get_child(3),
	"Track_3" : Tracks.get_child(6),
	"Track_4" : Tracks.get_child(9),
	"Track_5" : Tracks.get_child(12),
	"Track_6" : Tracks.get_child(15),
	"Track_7" : Tracks.get_child(15), # PLACEHOLDER.
	"Track_8" : Tracks.get_child(15), # PLACEHOLDER.
	"Track_9" : Tracks.get_child(18),
	"Track_15" : Tracks.get_child(15), # PLACEHOLDER.
}

var track_dict_100 = {
	"Track_1" : Tracks.get_child(1),
	"Track_2" : Tracks.get_child(4),
	"Track_3" : Tracks.get_child(7),
	"Track_4" : Tracks.get_child(10),
	"Track_5" : Tracks.get_child(13),
	"Track_6" : Tracks.get_child(16),
	"Track_7" : Tracks.get_child(16), # PLACEHOLDER.
	"Track_8" : Tracks.get_child(16), # PLACEHOLDER.
	"Track_9" : Tracks.get_child(19),
	"Track_15" : Tracks.get_child(16), # PLACEHOLDER.
}

var track_dict_125 = {
	"Track_1" : Tracks.get_child(2),
	"Track_2" : Tracks.get_child(5),
	"Track_3" : Tracks.get_child(8),
	"Track_4" : Tracks.get_child(11),
	"Track_5" : Tracks.get_child(14),
	"Track_6" : Tracks.get_child(17),
	"Track_7" : Tracks.get_child(17), # PLACEHOLDER.
	"Track_8" : Tracks.get_child(17), # PLACEHOLDER.
	"Track_9" : Tracks.get_child(20),
	"Track_15" : Tracks.get_child(17), # PLACEHOLDER.
}

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
			if s.name == "track_select":
				s.volume_db = -2
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
			s.pitch_scale = pitch
			s.play()
