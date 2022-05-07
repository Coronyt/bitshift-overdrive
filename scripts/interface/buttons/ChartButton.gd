extends Button

func _on_ChartButton_pressed():
	SoundManager.play_click1()
	self.get_parent().get_parent().get_parent().load_into_active()
	Active.chart = self.name
	Active.chart_name = self.text

func _on_ChartButton_mouse_entered():
	if self.disabled == false:
		SoundManager.play_hover()
