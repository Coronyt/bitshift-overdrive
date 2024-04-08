extends RichTextLabel

func _ready():
	if self.get_parent().name == "TitleScreen":
		self.bbcode_text = "[wave amp=25 freq=1][center]BITSHIFT OVERDRIVE [rainbow freq=0.6 sat=0.8 val=1]v1.1[/rainbow] - MADE WITH GODOT ENGINE 3 - THANK YOU FOR PLAYING!"
	if self.get_parent().name == "LevelSelect":
		self.bbcode_text = "[wave amp=25 freq=1][center]BITSHIFT OVERDRIVE v1.1 - MADE WITH GODOT ENGINE 3 - THANK YOU FOR PLAYING!"
	if self.get_parent().name == "ScoreCounter":
		self.bbcode_text = "[wave amp=25 freq=1][center]" + "-- " + Active.chart_name + " --"
