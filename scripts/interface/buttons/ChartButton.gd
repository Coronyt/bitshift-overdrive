extends Button

export(String) var diff_desc
export(String) var chart_key
export(int) var timestamp = 35

signal new_active_track
var bgm_playing

# Difficulty Ratings:
# Basic:		0.5 - 1.5
# Basic+:		2.0 - 3.0
# Advanced:		3.5 - 4.0
# Advanced+:	4.5 - 5.0
# Sadistic:		5.5+

func _ready():
	bgm_playing = true
	SoundManager.preview_playing = false
	if TrophyManager.trophy_queues[chart_key].size() > 0:
		$NoticeAnim.play("notice")

func _on_ChartButton_pressed():
	print("stopping + resetting preview timer 1 ...")
	# testing with the below line, hopefully it works
	self.get_parent().get_child(0).get_child(0).stop()
	print(self.get_parent().get_child(0).get_child(0).name)
	# _____
	self.get_parent().get_parent().get_parent().preview_playing = true
	SoundManager.play_sound("click1")
	if SoundManager.preview_playing:
		SoundManager.track_dict_100[Active.chart].stop()
		SoundManager.preview_playing = false
	else:
		#print("reached line 34 ... preview_playing was false so fading out bgm")
		fade_out_bgm()
		# self.get_parent().get_child(1).start()
	Active.chart = self.chart_key
	Active.chart_name = self.text
	Active.diff_desc = self.diff_desc
	if !SoundManager.preview_playing:
		if TrophyManager.trophy_queues[Active.chart].size() == 0:
			# I THINK A CONDITIONAL NEEDS TO GO RIGHT HERE FOR FADE-IN BUG PREVENTION ...
			fade_in_track()
		else:
			$NoticeAnim.stop()
			$NoticeAnim.seek(0, true)
	for button in self.get_parent().get_children():
		if button.is_class("Button"):
			button.pressed = false
	emit_signal("new_active_track")
	self.pressed = true
	#bgm_playing = false
	#print(bgm_playing) # TEMP

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
	bgm_playing = true
	print(bgm_playing) # TEMP
	print("stopping + resetting preview timer 1 ...")
	# testing with the below line, hopefully it works
	self.get_parent().get_child(0).get_child(0).stop()
	print(self.get_parent().get_child(0).get_child(0).name)
	print("fade_in_bgm stopped ... " + str(self.get_parent().get_child(0).get_child(0).is_stopped()))
	# _____

func fade_out_bgm():
	var audio_stream = SoundManager.fetch_audio_stream("track_select")
	var fade_tween = self.get_parent().get_child(0)
	SoundManager.track_select_last_pos = audio_stream.get_playback_position()
	fade_tween.interpolate_property(audio_stream, 
		"volume_db", UserPreferences.prefs["music_vol"] - 2, -80, 0.50, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	audio_stream.stop()
	bgm_playing = false
	print(bgm_playing) # TEMP

func fade_in_track():
	SoundManager.preview_playing = true
	var to_play = SoundManager.track_dict_100[Active.chart]
	var fade_tween = self.get_parent().get_child(0)
	fade_tween.interpolate_property(to_play, 
		"volume_db", -80, UserPreferences.prefs["music_vol"] - 2, 0.50, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	to_play.play(timestamp)
	var preview_timer = self.get_parent().get_child(0).get_child(0)
	# this is the problem ... this is getting called and starting the timer
		# the timer is starting BEFORE the next chart is selected ()
		# and the conditional in the timeout function isn't catching it cause the timeout is after trophy anims
		# i think the trophy signal should stop and reset this timer if possible
			# that should solve the fade-in delay bug
	print("checking if BGM is playing ...")
	print("bgm_playing = " + str(bgm_playing))
	#if bgm_playing == true:
	preview_timer.start()

func fade_out_track():
	#bgm_playing = true #??
	#SoundManager.preview_playing = false
	var to_stop = SoundManager.track_dict_100[Active.chart]
	var fade_tween = self.get_parent().get_child(0)
	fade_tween.interpolate_property(to_stop, 
		"volume_db", UserPreferences.prefs["music_vol"] - 2, -80, 1, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	var preview_timer = self.get_parent().get_child(0).get_child(1)
	preview_timer.start()

func _on_PreviewTimer1_timeout():
	print("PREVIEW TIMER JUST TIMED OUT")
	#if bgm_playing = true:
		#return
	fade_out_track()
	# testing with the below conditional
		# okay so it seems like ... the fade-in delay problem ONLY happens when
			# i click from one track to another (i.e. preview is already playing and is muted for trophy anims)
	if TrophyManager.trophy_queues[Active.chart].size() == 0:
		# make sure below conditional(s) don't break anything
		if self.get_parent().get_parent().get_parent().preview_playing:
			#if bgm_playing == false:
			fade_in_bgm()
			# the conditional here should be ...
			# IF BGM IS ALREADY PLAYING ... THEN DON'T CALL fade_in_bgm
			#print ("checking if BGM is playing ... " + str(bgm_playing))
			#if !bgm_playing: fade_in_bgm()

func _on_PreviewTimer2_timeout():
	SoundManager.track_dict_100[Active.chart].stop()
	SoundManager.preview_playing = false
	#bgm_playing = false

func _on_GameHub_trophy_anims_finished():
	var preview_timer = self.get_parent().get_child(0).get_child(0)
	fade_in_bgm()
	preview_timer.stop()

func _on_NoticeAnim_animation_finished(anim_name):
	$NoticeAnim.play("notice")
