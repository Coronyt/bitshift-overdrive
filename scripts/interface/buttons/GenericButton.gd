extends CheckBox

func _on_GenericButton_pressed():
	SoundManager.play_click1()

func _on_GenericButton_mouse_entered():
	SoundManager.play_hover()
