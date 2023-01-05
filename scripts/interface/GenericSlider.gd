extends HSlider

export(String) var pref_key

func _ready():
	self.value = UserPreferences.prefs[pref_key]

func adjust_vol(value):
	UserPreferences.prefs[pref_key] = self.value
	if pref_key == "music_vol":
		var pos = SoundManager.fetch_audio_stream("track_select").get_playback_position()
		SoundManager.stop_sound("track_select")
		SoundManager.play_sound("track_select")
		SoundManager.fetch_audio_stream("track_select").seek(pos)
