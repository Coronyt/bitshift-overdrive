extends Control

onready var TextNode = preload("res://scenes/objects/TextNode.tscn")

var can_click = false

var init_checked = false
var speed_checked = false
var dif1_checked = false
var dif2_checked = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var cursor_str_tex = load("res://assets/sprites/cursor.png")
	var cursor_img_obj  = Image.new()
	var cursor_img_tex = ImageTexture.new()
	cursor_img_obj = cursor_str_tex.get_data()
	cursor_img_obj.lock()
	cursor_img_tex.create_from_image(cursor_img_obj, 0)
	Input.set_custom_mouse_cursor(cursor_img_tex)
	$ScoreScapePulse.play("lower")
	SoundManager.play_sound("title2")

func _on_ScoreTimer_timeout():
	if init_checked == false:
		SoundManager.play_sound("score1")
		init_checked = true
		var init_label = TextNode.instance()
		init_label.text = "INITIAL SCORE\n" + str(Active.score) + "\n"
		$ScoreBox.add_child(init_label)
	elif dif1_checked == false:
		SoundManager.play_sound("score1")
		dif1_checked = true
		if Active.mod_dif_1 == "hibernate":
			Active.score = int(Active.score * 1)
			var init_label = TextNode.instance()
			init_label.text = "Hibernate\n" + "1x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.mod_dif_1 == "underclock":
			Active.score = int(Active.score * 1)
			var init_label = TextNode.instance()
			init_label.text = "Underclock\n" + "1x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.mod_dif_1 == "overdrive":
			Active.score = int(Active.score * 2)
			var init_label = TextNode.instance()
			init_label.text = "Overdrive\n" + "2x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.mod_dif_1 == "segfault":
			Active.score = int(Active.score * 4)
			var init_label = TextNode.instance()
			init_label.text = "Segfault\n" + "4x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
	elif dif2_checked == false:
		SoundManager.play_sound("score1")
		dif2_checked = true
		if Active.is_byte == true:
			Active.score = int(Active.score * 2)
			var init_label = TextNode.instance()
			init_label.text = "Arcade\n" + "2x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.is_nybl == true:
			Active.score = int(Active.score * 4)
			var init_label = TextNode.instance()
			init_label.text = "Nybble\n" + "4x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.is_iron == true:
			Active.score = int(Active.score * 8)
			var init_label = TextNode.instance()
			init_label.text = "Ironbit\n" + "8x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		else:
			Active.score = int(Active.score * 1)
			var init_label = TextNode.instance()
			init_label.text = "Classic\n" + "1x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
	elif speed_checked == false:
		SoundManager.play_sound("score1")
		speed_checked = true
		if Active.is_075 == true:
			Active.score = int(Active.score * 1)
			var init_label = TextNode.instance()
			init_label.text = "Speed 75%\n" + "1x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.is_090 == true:
			Active.score = int(Active.score * 1)
			var init_label = TextNode.instance()
			init_label.text = "Speed 90%\n" + "1x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.is_110 == true:
			Active.score = int(Active.score * 2)
			var init_label = TextNode.instance()
			init_label.text = "Speed 110%\n" + "2x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.is_125 == true:
			Active.score = int(Active.score * 4)
			var init_label = TextNode.instance()
			init_label.text = "Speed 125%\n" + "4x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		else:
			Active.score = int(Active.score * 1)
			var init_label = TextNode.instance()
			init_label.text = "Speed 100%\n" + "1x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
	else:
		SoundManager.play_sound("score1")
		SoundManager.play_sound("score2")
		$ScoreTimer.queue_free()
		TrophyManager.award_trophies()
		var init_label = TextNode.instance()
		ScoreManager.update_score(Active.chart, Active.score)
		if ScoreManager.score_dict[Active.chart][8] == Active.score:
			init_label.text = "HIGH SCORE\n" + str(Active.score)
			SoundManager.play_sound("trophy3")
			init_label.flash()
		else:
			init_label.text = "\nFINAL SCORE\n" + str(Active.score)
		$ScoreBox.add_child(init_label)
		$ScorePortal.show()

func _on_ScoreScapePulse_animation_finished(_anim_name):
	if _anim_name == "pulse":
		$ScoreScapePulse.play("pulse")
	else: # _anim_name == "lower":
		can_click = true
		$ScoreTimer.start()
		SoundManager.stop_sound("title2")
	
func _input(event):
	if can_click == true:
		if event is InputEventMouseButton and is_instance_valid($ScoreTimer):
			_on_ScoreTimer_timeout()
			$ScoreTimer.start()
