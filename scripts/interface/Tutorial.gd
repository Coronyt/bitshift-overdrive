extends Button

func _on_Tutorial_pressed():
	SoundManager.play_click1()
	SoundManager.play_title3()
	$TutorialAnim.play("to_tutorial")

func _on_BackButton_pressed():
	SoundManager.play_click1()
	SoundManager.play_title3()
	$TutorialAnim.play("from_tutorial")

func _on_TutorialAnim_animation_finished(anim_name):
	SoundManager.stop_title3()

func _on_Tutorial_mouse_entered():
	SoundManager.play_hover()

func _on_BackButton_mouse_entered():
	SoundManager.play_hover()
