extends KinematicBody2D

onready var NoteShatter = preload("res://scenes/objects/NoteShatter.tscn")
onready var ComboTick = preload("res://scenes/objects/ComboTick.tscn")

func fade():
	$NoteColl.disabled = true

func tick():
	var tick = ComboTick.instance()
	tick.global_position = Vector2(self.global_position.x + 20, self.global_position.y)
	self.get_parent().add_child(tick)

func shatter():
	var shatter = NoteShatter.instance()
	shatter.global_position = self.global_position
	self.get_parent().add_child(shatter)
	shatter.get_child(0).emitting = true
	$NoteShader/SSDissolveBurn.play(0.1)
	tick()

func _physics_process(_delta):
	if self.get_parent().get_parent().paused == false:
		self.move_and_slide(Vector2(0, 1) * self.get_parent().get_parent().speed)
