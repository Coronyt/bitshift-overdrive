extends Button

func _on_ExitPortal_pressed():
	SoundManager.play_click2()
	get_tree().quit()

func _on_ExitPortal_mouse_entered():
	SoundManager.play_hover()
