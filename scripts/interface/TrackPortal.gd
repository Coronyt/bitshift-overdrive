extends Button

func _physics_process(_delta):
	if Active.chart != "":
		self.disabled = false
	if Active.diff_desc != "":
		$DiffDescLabel.text = Active.diff_desc

func _on_TrackPortal_mouse_entered():
	if self.disabled == false:
		SoundManager.play_sound("hover")

func _on_TrackPortal_pressed():
	SoundManager.track_dict_100[Active.chart].stop()
	SoundManager.stop_sound("track_select")
	SoundManager.play_sound("click1")
	SoundManager.play_sound("title2")
	$PortalPeelAnim.play("peel")

func _on_PortalPeelAnim_animation_finished(_anim_name):
	SoundManager.stop_sound("title2")
	self.get_parent().load_into_active()
	get_tree().change_scene(ChartManager.fetch_chart_tscn(Active.chart))
