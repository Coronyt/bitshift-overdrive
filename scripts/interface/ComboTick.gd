extends Node2D

func _ready():
	$ComboLabel.text = str(Active.combo)
	$TickAnim.play("tick_float")

func _on_TickTimer_timeout():
	self.queue_free()
