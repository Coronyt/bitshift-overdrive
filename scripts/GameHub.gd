extends ColorRect

signal trophy_anims_finished

onready var trophy_0_sprite = preload("res://assets/sprites/trophy_0.stex")
onready var trophy_1_sprite = preload("res://assets/sprites/trophy_1.stex")
onready var trophy_2_sprite = preload("res://assets/sprites/trophy_2.stex")
onready var trophy_3_sprite = preload("res://assets/sprites/trophy_3.stex")
onready var trophy_4_sprite = preload("res://assets/sprites/trophy_4.stex")
onready var trophy_5_sprite = preload("res://assets/sprites/trophy_5.stex")

func _on_new_active_track():
	$ScoreLabel1.text = str(ScoreManager.score_dict[Active.chart][8])
	$ScoreLabel2.text = str(ScoreManager.score_dict[Active.chart][7])
	$ScoreLabel3.text = str(ScoreManager.score_dict[Active.chart][6])
	$ScoreLabel4.text = str(ScoreManager.score_dict[Active.chart][5])
	$ScoreLabel5.text = str(ScoreManager.score_dict[Active.chart][4])
	$ScoreLabel6.text = str(ScoreManager.score_dict[Active.chart][3])
	$ScoreLabel7.text = str(ScoreManager.score_dict[Active.chart][2])
	$ScoreLabel8.text = str(ScoreManager.score_dict[Active.chart][1])
	$ScoreLabel9.text = str(ScoreManager.score_dict[Active.chart][0])
	$TrophyCase/Trophy1/TrophyShader/SSShinyFx._set_active(false)
	$TrophyCase/Trophy2/TrophyShader/SSShinyFx._set_active(false)
	$TrophyCase/Trophy3/TrophyShader/SSShinyFx._set_active(false)
	$TrophyCase/Trophy4/TrophyShader/SSShinyFx._set_active(false)
	$TrophyCase/Trophy5/TrophyShader/SSShinyFx._set_active(false)
	if $ScoreAnims.is_playing():
		$ScoreAnims.stop()
	$ScoreAnims.play("show_scores")
	display_trophies()

func display_trophies():
	$TrophyCase/Trophy1.texture = trophy_0_sprite
	$TrophyCase/Trophy2.texture = trophy_0_sprite
	$TrophyCase/Trophy3.texture = trophy_0_sprite
	$TrophyCase/Trophy4.texture = trophy_0_sprite
	$TrophyCase/Trophy5.texture = trophy_0_sprite
	if TrophyManager.trophy_dict[Active.chart][0] == 1:
		if TrophyManager.trophy_queues[Active.chart].has(1):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$TrophyCase/Trophy1.texture = trophy_0_sprite
			$TrophyCase/TrophyAnim1.play("award")
		else:
			$TrophyCase/Trophy1.texture = trophy_1_sprite
	else: $TrophyCase/Trophy1.texture = trophy_0_sprite
	if TrophyManager.trophy_dict[Active.chart][1] == 1:
		if TrophyManager.trophy_queues[Active.chart].has(2):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$TrophyCase/Trophy2.texture = trophy_0_sprite
			$TrophyCase/TrophyAnim2.play("award")
		else:
			if TrophyManager.trophy_queues[Active.chart].has(3):
				$TrophyCase/Trophy2.texture = trophy_2_sprite
			else: $TrophyCase/Trophy2.texture = trophy_2_sprite
	else: $TrophyCase/Trophy2.texture = trophy_0_sprite
	if TrophyManager.trophy_dict[Active.chart][2] == 1:
		if TrophyManager.trophy_queues[Active.chart].has(3):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$TrophyCase/Trophy3.texture = trophy_0_sprite
			$TrophyCase/TrophyAnim3.play("award")
		else:
			$TrophyCase/Trophy3.texture = trophy_3_sprite
	else: $TrophyCase/Trophy3.texture = trophy_0_sprite
	if TrophyManager.trophy_dict[Active.chart][3] == 1:
		if TrophyManager.trophy_queues[Active.chart].has(4):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$TrophyCase/Trophy4.texture = trophy_0_sprite
			$TrophyCase/TrophyAnim4.play("award")
		else:
			$TrophyCase/Trophy4.texture = trophy_4_sprite
	else: $TrophyCase/Trophy4.texture = trophy_0_sprite
	if TrophyManager.trophy_dict[Active.chart][4] == 1:
		if TrophyManager.trophy_queues[Active.chart].has(5):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$TrophyCase/Trophy5.texture = trophy_0_sprite
			$TrophyCase/TrophyAnim5.play("award")
		else:
			$TrophyCase/Trophy5.texture = trophy_5_sprite
	else: $TrophyCase/Trophy5.texture = trophy_0_sprite
	self.get_parent().save_trophies()

func _on_TrophyAnim1_animation_finished(_anim_name):
	$TrophyCase/Trophy1.texture = trophy_1_sprite
	$TrophyCase/TrophyAnim1/Trophy1Dupe.hide()
	SoundManager.play_sound("trophy2")
	if TrophyManager.trophy_queues[Active.chart].size() == 1:
		SoundManager.play_sound("trophy3")
		emit_signal("trophy_anims_finished")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	TrophyManager.trophy_queues[Active.chart].remove(0)
	self.get_parent().save_trophies()

func _on_TrophyAnim2_animation_finished(_anim_name):
	$TrophyCase/Trophy2.texture = trophy_2_sprite
	$TrophyCase/TrophyAnim2/Trophy2Dupe.hide()
	SoundManager.play_sound("trophy2")
	if TrophyManager.trophy_queues[Active.chart].size() == 1:
		SoundManager.play_sound("trophy3")
		emit_signal("trophy_anims_finished")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	TrophyManager.trophy_queues[Active.chart].remove(0)
	self.get_parent().save_trophies()

func _on_TrophyAnim3_animation_finished(_anim_name):
	$TrophyCase/Trophy3.texture = trophy_3_sprite
	$TrophyCase/TrophyAnim3/Trophy3Dupe.hide()
	SoundManager.play_sound("trophy2")
	if TrophyManager.trophy_queues[Active.chart].size() == 1:
		SoundManager.play_sound("trophy3")
		emit_signal("trophy_anims_finished")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	TrophyManager.trophy_queues[Active.chart].remove(0)
	self.get_parent().save_trophies()

func _on_TrophyAnim4_animation_finished(_anim_name):
	$TrophyCase/Trophy4.texture = trophy_4_sprite
	$TrophyCase/TrophyAnim4/Trophy4Dupe.hide()
	SoundManager.play_sound("trophy2")
	if TrophyManager.trophy_queues[Active.chart].size() == 1:
		SoundManager.play_sound("trophy3")
		emit_signal("trophy_anims_finished")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	TrophyManager.trophy_queues[Active.chart].remove(0)
	self.get_parent().save_trophies()

func _on_TrophyAnim5_animation_finished(_anim_name):
	$TrophyCase/Trophy5.texture = trophy_5_sprite
	$TrophyCase/TrophyAnim5/Trophy5Dupe.hide()
	SoundManager.play_sound("trophy2")
	if TrophyManager.trophy_queues[Active.chart].size() == 1:
		SoundManager.play_sound("trophy3")
		emit_signal("trophy_anims_finished")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	TrophyManager.trophy_queues[Active.chart].remove(0)
	self.get_parent().save_trophies()
