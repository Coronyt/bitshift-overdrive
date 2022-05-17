extends Node2D

var curr_pos = Vector2()
var tick_counter = 0

func _ready():
	curr_pos = self.global_position

func _on_ComboTimer_timeout():
	if tick_counter == 10:
		self.queue_free()
	self.global_position = Vector2(curr_pos.x, curr_pos.y - 1)
	curr_pos = self.global_position
	tick_counter = tick_counter + 1
