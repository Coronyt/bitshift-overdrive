extends Button

func _ready():
	pass

func _physics_process(_delta):
	if Active.chart != "":
		self.disabled = false

func _on_TrackPortal_mouse_entered():
	if self.disabled == false:
		SoundManager.play_hover()

func _on_TrackPortal_pressed():
	SoundManager.stop_track_select()
	SoundManager.play_click1()
	SoundManager.play_title2()
	$PortalPeelAnim.play("peel")

func _on_PortalPeelAnim_animation_finished(anim_name):
	SoundManager.stop_title2()
	self.get_parent().load_into_active()
	get_tree().change_scene(ChartManager.fetch_chart_tscn(Active.chart))
