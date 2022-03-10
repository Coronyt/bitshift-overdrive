extends Button

func _on_Options_pressed():
	SoundManager.play_click1()
	$OptionsAnim.play("to_options")

func _on_BackButton_pressed():
	SoundManager.play_click1()
	$OptionsAnim.play("from_options")

func _on_OptionsAnim_animation_finished(anim_name):
	pass

func _on_Options_mouse_entered():
	SoundManager.play_hover()

func _on_BackButton_mouse_entered():
	SoundManager.play_hover()
