extends Label

func flash():
	$HighScoreAnim.play("high_score")

func _on_HighScoreAnim_animation_finished(anim_name):
	$HighScoreAnim.play("high_score")
