extends Button

func _on_ChartButton_pressed():
	SoundManager.play_click2()
	self.get_parent().get_parent().get_parent().load_into_active()
	Active.chart = self.name
	SoundManager.stop_track_select()
	get_tree().change_scene(ChartManager.fetch_chart_tscn(Active.chart))

func _on_ChartButton_mouse_entered():
	if self.disabled == false:
		SoundManager.play_hover()
