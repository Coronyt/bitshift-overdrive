extends Sprite

const card = preload("res://scenes/objects/TooltipCard.tscn")
var this_card

export(String) var trophy_name
export(String, MULTILINE) var trophy_desc

func _ready():
	$TrophyShader/SSShinyFx._set_active(false)

func _on_TrophyTimer1_timeout():
	if (self.texture.resource_path != "res://assets/sprites/trophy_0.png") and (
		self.texture.resource_path != "res://assets/sprites/trophy_0.stex"):
		$TrophyShader/SSShinyFx.play(0.5)
	$TrophyTimer2.start()

func _on_TrophyTimer2_timeout():
	if (self.texture.resource_path != "res://assets/sprites/trophy_0.png") and (
		self.texture.resource_path != "res://assets/sprites/trophy_0.stex"):
		$TrophyShader/SSShinyFx._set_active(false)
	$TrophyTimer1.start()

func _on_TrophyArea_mouse_entered():
	SoundManager.play_sound("hover")
	if not UserPreferences.prefs["disable_tooltips"]:
		this_card = card.instance()
		this_card.header = self.trophy_name
		this_card.body = self.trophy_desc
		self.get_parent().get_parent().get_parent().add_child(this_card)

func _on_TrophyArea_mouse_exited():
	if not UserPreferences.prefs["disable_tooltips"]:
		this_card.queue_free()
