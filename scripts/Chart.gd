extends Node2D

const cinematic_label = preload("res://scenes/cinematic/LabelOST.tscn")
export var cinematic = false

var countdown = 3
var tracking = false

var speed = 0
var paddle_pos_y = 0

var paused = false
var track_cache = 0.0
var cam_cache = 0.0

func play_track():
	if Active.speed == "SpeedButton1":
		speed = speed * 0.75
		Active.track_ref = SoundManager.track_dict_075[Active.chart]
		SoundManager.track_dict_075[Active.chart].play()
	if Active.speed == "SpeedButton2":
		speed = speed * 1.00
		Active.track_ref = SoundManager.track_dict_100[Active.chart]
		SoundManager.track_dict_100[Active.chart].play()
	if Active.speed == "SpeedButton3":
		speed = speed * 1.25
		Active.track_ref = SoundManager.track_dict_125[Active.chart]
		SoundManager.track_dict_125[Active.chart].play()

func fetch_track():
	if Active.speed == "SpeedButton1":
		return SoundManager.track_dict_075[Active.chart].get_playback_position()
	if Active.speed == "SpeedButton2":
		return SoundManager.track_dict_100[Active.chart].get_playback_position()
	if Active.speed == "SpeedButton3":
		return SoundManager.track_dict_125[Active.chart].get_playback_position()
		
func seek_track(pos):
	if Active.speed == "SpeedButton1":
		SoundManager.track_dict_075[Active.chart].play()
		SoundManager.track_dict_075[Active.chart].seek(pos)
	if Active.speed == "SpeedButton2":
		SoundManager.track_dict_100[Active.chart].play()
		SoundManager.track_dict_100[Active.chart].seek(pos)
	if Active.speed == "SpeedButton3":
		SoundManager.track_dict_125[Active.chart].play()
		SoundManager.track_dict_125[Active.chart].seek(pos)
		
func stop_track():
	if Active.speed == "SpeedButton1":
		SoundManager.track_dict_075[Active.chart].stop()
	if Active.speed == "SpeedButton2":
		SoundManager.track_dict_100[Active.chart].stop()
	if Active.speed == "SpeedButton3":
		SoundManager.track_dict_125[Active.chart].stop()

func _ready():
	if cinematic == true:
		$ChartTracker/ChartCamera/Paddle.hide()
		$ChartTracker/ChartCamera/ScoreCounter.hide()
		var new_cinematic_label = cinematic_label.instance()
		self.add_child(new_cinematic_label)
	cam_cache = $VaporCam.speed
	$VaporCam.speed = 0.015
	speed = $ChartCore.BPM * 5
	if cinematic == false:
		SoundManager.play_click2()
		cursor_to_puck()
	self.get_child(0).get_child(0).play("drop")
	self.get_child(1).get_child(0).rise_seq()
	$CountdownTimer.start()

func _on_Countdown_timeout():
	if countdown > 0:
		if cinematic == false:
			SoundManager.play_count1()
		countdown -= 1
	else:
		tracking = true
		play_track()
		if cinematic == false:
			SoundManager.play_count2()
		$VaporCam.speed = cam_cache
		$CountdownTimer.queue_free()

func check_health():
	if Active.is_iron == true:
		tracking = false
		Active.track_ref.stop()
		SoundManager.play_score1()
		SoundManager.play_score2()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(null)
		$ChartTracker/ChartCamera/Paddle.locked = true
		$ChartTracker/ChartCamera/GameOver.show()

func play_fade_anim():
	$ChartTracker/ChartCamera/FadeOut.play("FadeAnim")

func _on_FadeOut_animation_finished(_anim_name):
	get_tree().change_scene("res://scenes/ScoreScreen.tscn")

func _input(event):
	if Input.is_action_just_pressed("pause") and tracking == true:
		if paused == false:
			track_cache = fetch_track()
			cam_cache = $VaporCam.speed
			stop_track()
			$VaporCam.speed = 0
			$PauseScreen.show()
			$ChartTracker/ChartCamera/Paddle.locked = true
			Active.clear()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Input.set_custom_mouse_cursor(null)
			paused = true
		else:
			if cinematic == false:
				cursor_to_puck()
			$PauseScreen.hide()
			$VaporCam.speed = cam_cache
			$ChartTracker/ChartCamera/Paddle.locked = false
			seek_track(track_cache)
			paused = false

func cursor_to_puck():
	var puck_str_tex = load("res://assets/sprites/paddle_puck.png")
	var puck_img_obj  = Image.new()
	var puck_img_tex = ImageTexture.new()
	puck_img_obj = puck_str_tex.get_data()
	puck_img_obj.lock()
	puck_img_tex.create_from_image(puck_img_obj, 0)
	Input.set_custom_mouse_cursor(puck_img_tex)
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
