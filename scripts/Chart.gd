extends Node2D

const cinematic_label = preload("res://scenes/cinematic/LabelOST.tscn")
export var cinematic = false

onready var combo_spin = self.get_node("ChartTracker/ChartCamera/ComboLabel/ComboSpin")

onready var this_prog_bar = $ChartTracker/ProgressBar

var len_total = 0.0

var countdown = 3
var tracking = false

var speed = 0
var paddle_pos_y = 0

var paused = false
var track_cache = 0.0
var cam_cache = 0.0

func play_track():
	if Active.speed == "speed_090":
		speed = speed * 0.90
		Active.track_ref = SoundManager.track_dict_090[Active.chart]
		SoundManager.track_dict_090[Active.chart].volume_db = Active.vol_cache[Active.chart]
		SoundManager.track_dict_090[Active.chart].volume_db = SoundManager.track_dict_090[Active.chart].volume_db + UserPreferences.prefs["music_vol"]
		SoundManager.track_dict_090[Active.chart].play()
	if Active.speed == "speed_100":
		speed = speed * 1.00
		Active.track_ref = SoundManager.track_dict_100[Active.chart]
		SoundManager.track_dict_100[Active.chart].volume_db = Active.vol_cache[Active.chart]
		SoundManager.track_dict_100[Active.chart].volume_db = SoundManager.track_dict_100[Active.chart].volume_db + UserPreferences.prefs["music_vol"]
		SoundManager.track_dict_100[Active.chart].play()
	if Active.speed == "speed_110":
		speed = speed * 1.10
		Active.track_ref = SoundManager.track_dict_110[Active.chart]
		SoundManager.track_dict_110[Active.chart].volume_db = Active.vol_cache[Active.chart]
		SoundManager.track_dict_110[Active.chart].volume_db = SoundManager.track_dict_110[Active.chart].volume_db + UserPreferences.prefs["music_vol"]
		SoundManager.track_dict_110[Active.chart].play()
	len_total = Active.track_ref.stream.get_length()

func fetch_track():
	if Active.speed == "speed_090":
		return SoundManager.track_dict_090[Active.chart].get_playback_position()
	if Active.speed == "speed_100":
		return SoundManager.track_dict_100[Active.chart].get_playback_position()
	if Active.speed == "speed_110":
		return SoundManager.track_dict_110[Active.chart].get_playback_position()

func seek_track(pos):
	if Active.speed == "speed_090":
		SoundManager.track_dict_090[Active.chart].play()
		SoundManager.track_dict_090[Active.chart].seek(pos)
	if Active.speed == "speed_100":
		SoundManager.track_dict_100[Active.chart].play()
		SoundManager.track_dict_100[Active.chart].seek(pos)
	if Active.speed == "speed_110":
		SoundManager.track_dict_110[Active.chart].play()
		SoundManager.track_dict_110[Active.chart].seek(pos)

func stop_track():
	if Active.speed == "speed_090":
		SoundManager.track_dict_090[Active.chart].stop()
	if Active.speed == "speed_100":
		SoundManager.track_dict_100[Active.chart].stop()
	if Active.speed == "speed_110":
		SoundManager.track_dict_110[Active.chart].stop()

func _ready():
	Active.bgm_cache.stop()
	if cinematic == true:
		$ChartTracker/ChartCamera/Paddle.hide()
		$ChartTracker/ChartCamera/ScoreCounter.hide()
		var new_cinematic_label = cinematic_label.instance()
		self.add_child(new_cinematic_label)
	speed = $ChartCore.BPM * 5
	if cinematic == false:
		SoundManager.play_sound("click2")
		cursor_to_puck()
	self.get_child(0).get_child(0).play("drop")
	self.get_child(1).get_child(0).rise_seq()
	$CountdownTimer.start()

func _on_Countdown_timeout():
	Active.bgm_cache.stop()
	if countdown > 0:
		if cinematic == false:
			SoundManager.play_sound("count1")
		countdown -= 1
	else:
		tracking = true
		play_track()
		if cinematic == false:
			SoundManager.play_sound("count2")
		$CountdownTimer.queue_free()
		$ChartCore.track_milestones()
		$ChartCore.speed = speed

func check_health():
	if Active.last_milestone != 0:
		combo_spin.play("spin")
	if Active.is_iron == true:
		game_over()
	if Active.is_byte:
		if Active.health <= 0:
			game_over()
		this_prog_bar.get_child(4).value = Active.health
	if Active.is_nybl:
		if Active.health <= 0:
			game_over()
		this_prog_bar.get_child(5).value = Active.health

func game_over():
	tracking = false
	puck_to_cursor()
	Active.track_ref.stop()
	SoundManager.play_sound("score1")
	SoundManager.play_sound("score2")
	$ChartTracker/ChartCamera/Paddle.locked = true
	$ChartTracker/ChartCamera/GameOver.show()
	Active.active = []

func play_fade_anim():
	$ChartTracker/ChartCamera/FadeOut.play("FadeAnim")

func _on_FadeOut_animation_finished(_anim_name):
	get_tree().change_scene("res://scenes/ScoreScreen.tscn")

func _input(_event):
	if Input.is_action_just_pressed("pause") and tracking == true:
		if paused == false:
			track_cache = fetch_track()
			stop_track()
			$PauseScreen.show()
			$ChartTracker/ChartCamera/Paddle.locked = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			puck_to_cursor()
			paused = true
			for note in Active.active:
				if note: note.note_speed = 0.0
		else:
			if cinematic == false:
				cursor_to_puck()
			$PauseScreen.hide()
			$ChartTracker/ChartCamera/Paddle.locked = false
			seek_track(track_cache)
			paused = false
			for note in Active.active:
				if note: note.note_speed = speed

func cursor_to_puck():
	var puck_str_tex = load("res://assets/sprites/paddle_puck.png")
	var puck_img_obj  = Image.new()
	var puck_img_tex = ImageTexture.new()
	puck_img_obj = puck_str_tex.get_data()
	puck_img_obj.lock()
	puck_img_tex.create_from_image(puck_img_obj, 0)
	Input.set_custom_mouse_cursor(puck_img_tex)
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func puck_to_cursor():
	var cursor_str_tex = load("res://assets/sprites/cursor-slim.png")
	var cursor_img_obj  = Image.new()
	var cursor_img_tex = ImageTexture.new()
	cursor_img_obj = cursor_str_tex.get_data()
	cursor_img_obj.lock()
	cursor_img_tex.create_from_image(cursor_img_obj, 0)
	Input.set_custom_mouse_cursor(cursor_img_tex)
