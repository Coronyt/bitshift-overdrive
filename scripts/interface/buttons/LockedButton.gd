extends Button

export(String, MULTILINE) var body = ""
const card = preload("res://scenes/objects/TooltipCard.tscn")
var this_card

func _ready():
	if self.text == "Faster":
		if TrophyManager.sum_trophies() >= 5:
			self.hide()
	if self.text == "Ironbit":
		if TrophyManager.sum_trophies() >= 10:
			self.hide()

func _on_GenericButton_pressed():
	SoundManager.play_sound("click1")
	if self.get_parent().name == "DifLabel1":
		UserPreferences.prefs["diff_1"] = self.name
	if self.get_parent().name == "DifLabel2":
		UserPreferences.prefs["diff_2"] = self.name
	if self.get_parent().name == "SpeedLabel":
		UserPreferences.prefs["speed"] = self.name
	UserPreferences.save_prefs()

func _on_GenericButton_mouse_entered():
	SoundManager.play_sound("hover")
	if not UserPreferences.prefs["disable_tooltips"]:
		this_card = card.instance()
		this_card.header = self.text
		this_card.body = self.body
		self.get_parent().get_parent().add_child(this_card)

func _on_GenericButton_mouse_exited():
	if not UserPreferences.prefs["disable_tooltips"]:
		this_card.queue_free()
