extends Sprite

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
