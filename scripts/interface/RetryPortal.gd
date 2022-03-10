extends Button

func _on_RetryPortal_pressed():
	SoundManager.play_click2()
	Active.score = 0
	Active.track_ref = null
	get_tree().reload_current_scene()

func _on_RetryPortal_mouse_entered():
	SoundManager.play_hover()
