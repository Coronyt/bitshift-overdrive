extends Node

func _on_Tutorial_toggled(button_pressed):
	SoundManager.play_sound("click1")
	SoundManager.play_sound("title2")
	if $TutorialAnim.is_playing() == false:
		if button_pressed == true:
			$TutorialAnim.play("to_tut")
		else:
			$TutorialAnim.play("tut_up")

func _on_Tutorial_mouse_entered():
	SoundManager.play_sound("hover")

func _on_TutorialAnim_animation_finished(anim_name):
	if anim_name == "to_tut":
		$TutorialAnim.play("tut_down")
	if anim_name == "tut_up":
		$TutorialAnim.play("from_tut")
	if anim_name == "from_tut":
		SoundManager.stop_sound("title2")
		SoundManager.play_sound("click2")
	if anim_name == "tut_down":
		SoundManager.stop_sound("title2")
		SoundManager.play_sound("click2")
