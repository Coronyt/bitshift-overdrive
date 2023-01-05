extends Button

func _on_Options_pressed():
	SoundManager.play_sound("click1")
	if !self.get_parent().preview_playing:
		$OptionsAnim.play("to_options")
	else:
		self.get_parent().get_node("TrackList/TrackList/Track_A1").fade_out_track()
		self.get_parent().get_node("TrackList/TrackList/Track_A1").fade_in_bgm()
		$OptionsAnim.play("to_options")

func _on_BackButton_pressed():
	UserPreferences.save_prefs()
	SoundManager.play_sound("click1")
	$OptionsAnim.play("from_options")

func _on_OptionsAnim_animation_finished(anim_name):
	pass

func _on_Options_mouse_entered():
	SoundManager.play_sound("hover")

func _on_BackButton_mouse_entered():
	SoundManager.play_sound("hover")
