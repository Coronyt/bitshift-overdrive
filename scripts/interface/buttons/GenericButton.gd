extends CheckBox

export var body = ""
const card = preload("res://scenes/objects/TooltipCard.tscn")
var this_card

func _on_GenericButton_pressed():
	SoundManager.play_click1()

func _on_GenericButton_mouse_entered():
	SoundManager.play_hover()
	if self.get_parent().name != "SpeedLabel":
		this_card = card.instance()
		this_card.header = self.text
		this_card.body = self.body
	self.get_parent().get_parent().add_child(this_card)

func _on_GenericButton_mouse_exited():
	this_card.queue_free()
