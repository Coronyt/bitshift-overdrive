extends Button

func _on_Tutorial_pressed():
	SoundManager.play_sound("click1")
	SoundManager.play_sound("title3")
	$TutorialAnim.play("to_tutorial")

func _on_BackButton_pressed():
	SoundManager.play_sound("click1")
	SoundManager.play_sound("title3")
	$TutorialAnim.play("from_tutorial")

func _on_TutorialAnim_animation_finished(anim_name):
	SoundManager.stop_sound("title3")

func _on_Tutorial_mouse_entered():
	SoundManager.play_sound("hover")

func _on_BackButton_mouse_entered():
	SoundManager.play_sound("hover")
