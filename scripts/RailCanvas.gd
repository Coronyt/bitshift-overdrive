extends Node2D

func rise_seq():
	$RailRise.play("rise_1")
	SoundManager.play_sound("title3")

func _on_RailRise_animation_finished(anim_name):
	if anim_name == "rise_1":
		SoundManager.play_sound("score2")
		SoundManager.stop_sound("title3")
