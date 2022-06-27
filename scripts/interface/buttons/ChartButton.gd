extends Button

func _on_ChartButton_pressed():
	SoundManager.play_click1()
	Active.chart = self.name
	Active.chart_name = self.text

func _on_ChartButton_mouse_entered():
	if self.disabled == false:
		SoundManager.play_hover()
