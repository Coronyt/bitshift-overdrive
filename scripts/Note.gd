extends KinematicBody2D

onready var NoteShatter = preload("res://scenes/objects/NoteShatter.tscn")

func fade():
	$NoteColl.disabled = true
	$NoteSprite.play("pop_2")

func shatter():
	var shatter = NoteShatter.instance()
	shatter.global_position = self.global_position
	self.get_parent().add_child(shatter)
	shatter.get_child(0).emitting = true
	$NoteShader/SSDissolveBurn.play(0.1)
	
func _physics_process(_delta):
	if self.get_parent().paused == false:
		self.move_and_slide(Vector2(0, 1) * self.get_parent().speed)
