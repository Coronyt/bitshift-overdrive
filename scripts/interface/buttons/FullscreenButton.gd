extends Node

func _on_Fullscreen_mouse_entered():
	SoundManager.play_hover()

func _on_Fullscreen_pressed():
	SoundManager.play_click1()
	OS.window_fullscreen = !OS.window_fullscreen
