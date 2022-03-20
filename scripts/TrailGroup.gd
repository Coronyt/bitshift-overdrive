extends Node2D

func _ready():
	$TrailAnim.play("trail_idle")

func _on_TrailAnim_animation_finished(_anim_name):
	$TrailAnim.play("trail_idle")
