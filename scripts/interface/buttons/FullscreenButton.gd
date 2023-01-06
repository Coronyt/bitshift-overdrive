extends Node

func _on_Fullscreen_mouse_entered():
	SoundManager.play_sound("hover")

func _on_Fullscreen_pressed():
	SoundManager.play_sound("click1")
	OS.window_fullscreen = !OS.window_fullscreen
	UserPreferences.prefs["full"] = !UserPreferences.prefs["full"]
	UserPreferences.save_prefs()
