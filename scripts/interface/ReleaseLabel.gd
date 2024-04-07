extends RichTextLabel

func _ready():
	if self.get_parent().name == "TitleScreen":
		self.bbcode_text = "[wave amp=25 freq=1][center]BITSHIFT OVERDRIVE 1.1 - MADE WITH GODOT ENGINE 3 - THANK YOU FOR PLAYING!"
	if self.get_parent().name == "LevelSelect":
		self.bbcode_text = "[wave amp=25 freq=1][center]BITSHIFT OVERDRIVE 1.1 - MADE WITH GODOT ENGINE 3 - THANK YOU FOR PLAYING!"
	if self.get_parent().name == "ScoreCounter":
		self.bbcode_text = "[wave amp=25 freq=1][center]" + "-- " + Active.chart_name + " --"
