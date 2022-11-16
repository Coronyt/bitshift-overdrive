extends CanvasLayer

func _ready():
	refresh_CRT()

func refresh_CRT():
	if UserPreferences.prefs["disable_screen_curve"]:
		self.hide()
	else:
		self.show()
