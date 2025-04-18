extends Button

export(String) var diff_desc
export(String) var chart_key
export(int) var timestamp = 35

signal new_active_track
var bgm_playing
var last_bgm_db
var this_track
var this_vol

func _ready():
	this_track = SoundManager.track_dict_100[self.chart_key]
	if self.chart_key in Active.vol_cache.keys():
		this_vol = Active.vol_cache[self.chart_key]
	else:
		this_vol = this_track.volume_db
	bgm_playing = true
	SoundManager.preview_playing = false
	var bgm = SoundManager.fetch_audio_stream("track_select")
	if TrophyManager.trophy_queues[chart_key].size() > 0:
		$NoticeAnim.play("notice")
	last_bgm_db = bgm.volume_db

func _on_ChartButton_pressed():
	this_track.volume_db = this_vol
	self.get_parent().get_parent().get_parent().preview_playing = true
	SoundManager.play_sound("click1")
	if SoundManager.preview_playing:
		SoundManager.track_dict_100[Active.chart].stop()
		SoundManager.preview_playing = false
	else:
		fade_out_bgm()
	Active.chart = self.chart_key
	Active.chart_name = self.text
	Active.diff_desc = self.diff_desc
	Active.vol_cache[self.chart_key] = this_vol
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
		"volume_db", -80, Active.final_db, 1, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	self.get_parent().get_parent().get_parent().preview_playing = false
	bgm_playing = true

func fade_out_bgm():
	var audio_stream = SoundManager.fetch_audio_stream("track_select")
	var fade_tween = self.get_parent().get_child(0)
	SoundManager.track_select_last_pos = audio_stream.get_playback_position()
	fade_tween.interpolate_property(audio_stream, 
		"volume_db", Active.final_db, -80, 0.50, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	audio_stream.stop()
	bgm_playing = false

func fade_in_track():
	SoundManager.preview_playing = true
	var to_play = SoundManager.track_dict_100[Active.chart]
	to_play.volume_db = this_vol
	var fade_tween = self.get_parent().get_child(0)
	fade_tween.interpolate_property(to_play, 
		"volume_db", -80, to_play.volume_db + UserPreferences.prefs["music_vol"], 0.50, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	to_play.play(timestamp)
	var preview_timer = self.get_parent().get_child(0).get_child(0)
	preview_timer.start()

func fade_out_track():
	var to_stop = SoundManager.track_dict_100[Active.chart]
	var fade_tween = self.get_parent().get_child(0)
	fade_tween.interpolate_property(to_stop, 
		"volume_db", to_stop.volume_db, -80, 1, 1, Tween.EASE_IN, 0)
	fade_tween.start()
	var preview_timer = self.get_parent().get_child(0).get_child(1)
	preview_timer.start()

func _on_PreviewTimer1_timeout():
	fade_out_track()
	if TrophyManager.trophy_queues[Active.chart].size() == 0:
		if self.get_parent().get_parent().get_parent().preview_playing:
			fade_in_bgm()

func _on_PreviewTimer2_timeout():
	SoundManager.track_dict_100[Active.chart].stop()
	SoundManager.preview_playing = false

func _on_GameHub_trophy_anims_finished():
	var preview_timer = self.get_parent().get_child(0).get_child(0)
	fade_in_bgm()
	preview_timer.stop()

func _on_NoticeAnim_animation_finished(_anim_name):
	$NoticeAnim.play("notice")
