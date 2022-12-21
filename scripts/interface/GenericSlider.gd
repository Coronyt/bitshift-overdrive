extends HSlider

export(String) var pref_key

func _ready():
	self.value = UserPreferences.prefs[pref_key]

func adjust_vol(value):
	UserPreferences.prefs[pref_key] = self.value
