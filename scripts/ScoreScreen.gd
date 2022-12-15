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
	elif speed_checked == false:
		SoundManager.play_sound("score1")
		speed_checked = true
		if Active.is_slow == true:
			Active.score = int(Active.score * 0.75)
			var init_label = TextNode.instance()
			init_label.text = "Speed 0.75\n" + "0.75x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.is_fast == true:
			Active.score = int(Active.score * 2.00)
			var init_label = TextNode.instance()
			init_label.text = "Speed 1.25\n" + "2.00x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		else:
			var init_label = TextNode.instance()
			init_label.text = "Speed 1.00\n" + "1.00x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
	elif dif1_checked == false:
		SoundManager.play_sound("score1")
		dif1_checked = true
		if Active.mod_dif_1 == "DifButton0":
			Active.score = int(Active.score * 0.75)
			var init_label = TextNode.instance()
			init_label.text = "Hibernate\n" + "0.75x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.mod_dif_1 == "DifButton1":
			Active.score = int(Active.score * 1.00)
			var init_label = TextNode.instance()
			init_label.text = "Underclock\n" + "1.00x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.mod_dif_1 == "DifButton2":
			Active.score = int(Active.score * 1.75)
			var init_label = TextNode.instance()
			init_label.text = "Overdrive\n" + "1.75x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.mod_dif_1 == "DifButton3":
			Active.score = int(Active.score * 2.50)
			var init_label = TextNode.instance()
			init_label.text = "Segfault\n" + "2.50x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
	elif dif2_checked == false:
		SoundManager.play_sound("score1")
		dif2_checked = true
		if Active.is_byte == true:
			Active.score = int(Active.score * 2.00)
			var init_label = TextNode.instance()
			init_label.text = "Byte\n" + "2.00x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.is_nybl == true:
			Active.score = int(Active.score * 2.50)
			var init_label = TextNode.instance()
			init_label.text = "Nybble\n" + "2.50x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		elif Active.is_iron == true:
			Active.score = int(Active.score * 3.00)
			var init_label = TextNode.instance()
			init_label.text = "Ironbit\n" + "3.00x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
		else:
			Active.score = int(Active.score * 1.00)
			var init_label = TextNode.instance()
			init_label.text = "Classic\n" + "1.00x     " + str(Active.score) + "\n"
			$ScoreBox.add_child(init_label)
	else:
		SoundManager.play_sound("score1")
		SoundManager.play_sound("score2")
		$ScoreTimer.queue_free()
		var init_label = TextNode.instance()
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
