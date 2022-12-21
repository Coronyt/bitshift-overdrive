extends CheckBox

export(String) var pref_desc
export(String) var pref_key

func refresh_pref_text():
	var checkbox = "OFF"
	if not UserPreferences.prefs[pref_key]:
		checkbox = "ON (Default)"
	self.text = pref_desc + " : " + checkbox

func _ready():
	refresh_pref_text()

func _on_PrefButton1_pressed():
	SoundManager.play_sound("click1")
	UserPreferences.prefs[pref_key] = !UserPreferences.prefs[pref_key]
	UserPreferences.save_prefs()
	refresh_pref_text()

func _on_PrefButton1_mouse_entered():
	SoundManager.play_sound("hover")
