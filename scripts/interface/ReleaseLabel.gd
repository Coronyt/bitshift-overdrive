extends RichTextLabel

func _ready():
	if self.get_parent().name == "TitleScreen":
		self.bbcode_text = "[wave amp=25 freq=1][center]BITSHIFT OVERDRIVE - PRE-RELEASE BUILD"
	if self.get_parent().name == "LevelSelect":
		self.bbcode_text = "[wave amp=25 freq=1][center]BITSHIFT OVERDRIVE - PRE-RELEASE BUILD"
	if self.get_parent().name == "ScoreCounter":
		self.bbcode_text = "[wave amp=25 freq=1][center]" + "-- " + Active.chart_name + " --"
