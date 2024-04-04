extends RichTextLabel

func _on_new_active_track():
	if Active.chart != "":
		var to_bb = "[wave amp=25 freq=1][center]" + "-- " + Active.chart_name + " --"
		if self.bbcode_text != to_bb:
			self.bbcode_text = to_bb
