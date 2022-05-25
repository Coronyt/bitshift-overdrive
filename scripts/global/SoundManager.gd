extends Node

const track_tscn = preload("res://scenes/global/Tracks.tscn")

var track_dict_075 = {
	"Track_1" : Tracks.get_child(0),
	"Track_2" : Tracks.get_child(3),
	"Track_3" : Tracks.get_child(6),
	"Track_4" : Tracks.get_child(9),
	"Track_5" : Tracks.get_child(12),
	"Track_6" : Tracks.get_child(15),
}

var track_dict_100 = {
	"Track_1" : Tracks.get_child(1),
	"Track_2" : Tracks.get_child(4),
	"Track_3" : Tracks.get_child(7),
	"Track_4" : Tracks.get_child(10),
	"Track_5" : Tracks.get_child(13),
	"Track_6" : Tracks.get_child(16),
}

var track_dict_125 = {
	"Track_1" : Tracks.get_child(2),
	"Track_2" : Tracks.get_child(5),
	"Track_3" : Tracks.get_child(8),
	"Track_4" : Tracks.get_child(11),
	"Track_5" : Tracks.get_child(14),
	"Track_6" : Tracks.get_child(17),
}

func play_click1():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "click1":
			s.play()

func play_click2():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "click2":
			s.play()

func play_count1():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "count1":
			s.play()

func play_count2():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "count2":
			s.play()

func play_hover():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "hover":
			s.play()

func play_miss():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "miss":
			s.play()

func play_score1():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "score1":
			s.play()

func play_score2():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "score2":
			s.play()

func play_track_select():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "track_select":
			s.play()

func stop_track_select():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "track_select":
			s.stop()

func play_title1():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "title1":
			s.play()

func play_title2():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "title2":
			s.play()

func play_title3():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "title3":
			s.play()

func stop_title1():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "title1":
			s.stop()

func stop_title2():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "title2":
			s.stop()

func stop_title3():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "title3":
			s.stop()

func play_title_track():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "title_track":
			s.play()

func stop_title_track():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "title_track":
			s.stop()

func play_flair1():
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "flair1":
			s.play()

func play_combo(pitch):
	var sounds = Sounds.get_children()
	for s in sounds:
		if s.name == "combo":
			s.pitch_scale = pitch
			s.play()
