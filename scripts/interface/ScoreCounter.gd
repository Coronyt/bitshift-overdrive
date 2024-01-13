extends Control

func _on_ScoreTimer_timeout():
	$ScoreLabel.bbcode_text = "[center]" + "\n" + str(Active.score) + "[/center]"
