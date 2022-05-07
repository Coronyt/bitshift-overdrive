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
	SoundManager.play_click1()
	$PortalPeelAnim.play("peel")

func _on_PortalPeelAnim_animation_finished(anim_name):
	pass # Replace with function body.
