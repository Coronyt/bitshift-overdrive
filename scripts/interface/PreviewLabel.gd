extends RichTextLabel

func _physics_process(_delta):
	if Active.chart != "":
		var to_bb = "[wave amp=25 freq=1][center]" + "-- " + Active.chart_name + " --"
		if self.bbcode_text != to_bb:
			self.bbcode_text = to_bb
