extends Button

func _on_ScorePortal_pressed():
	Active.refresh()
	SoundManager.play_sound("click2")
	SoundManager.stop_sound("title_track")
	get_tree().change_scene("res://scenes/LevelSelect.tscn")

func _on_ScorePortal_mouse_entered():
	SoundManager.play_sound("hover")
