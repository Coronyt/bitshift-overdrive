extends Button

const card = preload("res://scenes/objects/TooltipCard.tscn")
var this_card

func _on_Options_pressed():
	SoundManager.play_sound("click1")
	if !self.get_parent().preview_playing:
		$OptionsAnim.play("to_options")
	elif !this_card:
		$OptionsTimer.start()
		this_card = card.instance()
		this_card.header = "Waiting for track preview to finish ..."
		this_card.body = ""
		self.get_parent().get_parent().add_child(this_card)

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

func _on_OptionsTimer_timeout():
	this_card.queue_free()
	$OptionsAnim.play("to_options")
