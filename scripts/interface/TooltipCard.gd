extends ColorRect

export var header = ""
export var body = ""

func _ready():
	$CardAnims.play("display_card")
	$HeaderLabel.text = header

func _on_CardAnims_animation_finished(_anim_name):
	$BodyLabel.text = body
	$BodyLabel.show()
