extends Node2D

func rise_seq():
	$RailRise.play("rise_1")
	SoundManager.play_title3()

func _on_RailRise_animation_finished(anim_name):
	if anim_name == "rise_1":
		$RailRise.play("rise_2")
		SoundManager.play_score2()
		SoundManager.play_title3()
	if anim_name == "rise_2":
		$RailRise.play("rise_3")
		SoundManager.play_title3()
	if anim_name == "rise_3":
		SoundManager.play_score1()
		SoundManager.stop_title3()
