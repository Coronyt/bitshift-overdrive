extends Button

func _on_RetryPortal_pressed():
	SoundManager.play_sound("click2")
	Active.score = 0
	Active.combo = 0
	Active.track_ref = null
	Active.last_milestone = 0
	get_tree().reload_current_scene()

func _on_RetryPortal_mouse_entered():
	SoundManager.play_sound("hover")
