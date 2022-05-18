extends KinematicBody2D

onready var NoteShatter = preload("res://scenes/objects/NoteShatter.tscn")
onready var ComboTick = preload("res://scenes/objects/ComboTick.tscn")

func fade():
	# $NoteColl.disabled = true
	pass # Missed note delay currently disabled.

func tick():
	var tick = ComboTick.instance()
	# Alternate combo tick spawns from right to left.
	if Active.combo_LR == false:
		tick.global_position = Vector2(self.global_position.x + 97.5, self.global_position.y - 25)
		Active.combo_LR = true
	else:
		tick.global_position = Vector2(self.global_position.x - 97.5, self.global_position.y - 25)
		Active.combo_LR = false
	self.get_parent().add_child(tick)

func shatter():
	var shatter = NoteShatter.instance()
	shatter.global_position = self.global_position
	self.get_parent().add_child(shatter)
	shatter.get_child(0).emitting = true
	$NoteShader/SSDissolveBurn.play(0.1)
	Active.combo += 1
	tick()

func _physics_process(_delta):
	if self.get_parent().get_parent().paused == false:
		self.move_and_slide(Vector2(0, 1) * self.get_parent().get_parent().speed)
