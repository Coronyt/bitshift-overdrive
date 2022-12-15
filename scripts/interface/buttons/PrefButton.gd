extends CheckBox

export(String) var pref_desc
export(String) var pref_key

func refresh_pref_text():
	var checkbox = "OFF"
	if pref_key == "disable_screen_curve":
		checkbox = "ON (Default)"
	if UserPreferences.prefs[pref_key]:
		checkbox = "ON (Default)"
		if pref_key == "disable_screen_curve":
			checkbox = "OFF"
	self.text = pref_desc + " : " + checkbox

func _ready():
	refresh_pref_text()

func _on_PrefButton1_pressed():
	SoundManager.play_click1()
	UserPreferences.prefs[pref_key] = !UserPreferences.prefs[pref_key]
	UserPreferences.save_prefs()
	refresh_pref_text()

func _on_PrefButton1_mouse_entered():
	SoundManager.play_hover()
