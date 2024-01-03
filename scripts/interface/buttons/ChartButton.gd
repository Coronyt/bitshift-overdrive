extends Button

export(String) var diff_desc
export(String) var chart_key

signal new_active_track

# Difficulty Ratings:
# Basic:		0.5 - 1.5
# Basic+:		2.0 - 3.0
# Advanced:		3.5 - 4.0
# Advanced+:	4.5 - 5.0
# Sadistic:		5.5+

func _ready():
	SoundManager.preview_playing = false
	if TrophyManager.trophy_queues[chart_key].size() > 0:
		$NoticeAnim.play("notice")

func _on_ChartButton_pressed():
	self.get_parent().get_parent().get_parent().preview_playing = true
	SoundManager.play_sound("click1")
	if SoundManager.preview_playing:
		SoundManager.track_dict_100[Active.chart].stop()
		SoundManager.preview_playing = false
	else:
		fade_out_bgm()
		# self.get_parent().get_child(1).start()
	Active.chart = self.chart_key
	Active.chart_name = self.text
	Active.diff_desc = self.diff_desc
	if !SoundManager.preview_playing:
		if TrophyManager.trophy_queues[Active.chart].size() == 0:
			fade_in_track()
		else:
			$NoticeAnim.stop()
			$NoticeAnim.seek(0, true)
	for button in self.get_parent().get_children():
		if button.is_class("Button"):
			button.pressed = false
	emit_signal("new_active_track")
	self.pressed = true

func _on_ChartButton_mouse_entered():
	if self.disabled == false:
		SoundManager.play_sound("hover")

func fade_in_bgm():
	var audio_stream = SoundManager.fetch_audio_stream("track_select")
	var fade_tween = self.get_parent().get_child(0)
	audio_stream.play(SoundManager.track_select_last_pos)
	fade_tween.interpolate_property(audio_stream, 
		"volume_db", -80, UserPreferences.prefs["music_vol"] - 2, 1, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	self.get_parent().get_parent().get_parent().preview_playing = false

func fade_out_bgm():
	var audio_stream = SoundManager.fetch_audio_stream("track_select")
	var fade_tween = self.get_parent().get_child(0)
	SoundManager.track_select_last_pos = audio_stream.get_playback_position()
	fade_tween.interpolate_property(audio_stream, 
		"volume_db", UserPreferences.prefs["music_vol"] - 2, -80, 0.50, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	audio_stream.stop()

func fade_in_track():
	SoundManager.preview_playing = true
	var to_play = SoundManager.track_dict_100[Active.chart]
	var fade_tween = self.get_parent().get_child(0)
	fade_tween.interpolate_property(to_play, 
		"volume_db", -80, UserPreferences.prefs["music_vol"] - 2, 0.50, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	to_play.play(35)
	var preview_timer = self.get_parent().get_child(0).get_child(0)
	# this is the problem ... this is getting called and starting the timer
		# the timer is starting BEFORE the next chart is selected ()
		# and the conditional in the timeout function isn't catching it cause the timeout is after trophy anims
		# i think the trophy signal should stop and reset this timer if possible
			# that should solve the fade-in delay bug
	preview_timer.start()

func fade_out_track():
	SoundManager.preview_playing = false
	var to_stop = SoundManager.track_dict_100[Active.chart]
	var fade_tween = self.get_parent().get_child(0)
	fade_tween.interpolate_property(to_stop, 
		"volume_db", UserPreferences.prefs["music_vol"] - 2, -80, 1, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	var preview_timer = self.get_parent().get_child(0).get_child(1)
	preview_timer.start()

func _on_PreviewTimer1_timeout():
	fade_out_track()
	# testing with the below conditional
		# okay so it seems like ... the fade-in delay problem ONLY happens when
			# i click from one track to another (i.e. preview is already playing and is muted for trophy anims)
	if TrophyManager.trophy_queues[Active.chart].size() == 0:
		# make sure below conditional doesn't break anything
		if self.get_parent().get_parent().get_parent().preview_playing:
			fade_in_bgm()

func _on_PreviewTimer2_timeout():
	SoundManager.track_dict_100[Active.chart].stop()

func _on_GameHub_trophy_anims_finished():
	var preview_timer = self.get_parent().get_child(0).get_child(0)
	fade_in_bgm()
	preview_timer.stop()

func _on_NoticeAnim_animation_finished(anim_name):
	$NoticeAnim.play("notice")
