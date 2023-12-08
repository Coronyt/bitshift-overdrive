extends ColorRect

func _on_new_active_track():
	$ScoreLabel1.text = str(ScoreManager.score_dict[Active.chart][8])
	$ScoreLabel2.text = str(ScoreManager.score_dict[Active.chart][7])
	$ScoreLabel3.text = str(ScoreManager.score_dict[Active.chart][6])
	$ScoreLabel4.text = str(ScoreManager.score_dict[Active.chart][5])
	$ScoreLabel5.text = str(ScoreManager.score_dict[Active.chart][4])
	$ScoreLabel6.text = str(ScoreManager.score_dict[Active.chart][3])
	$ScoreLabel7.text = str(ScoreManager.score_dict[Active.chart][2])
	$ScoreLabel8.text = str(ScoreManager.score_dict[Active.chart][1])
	$ScoreLabel9.text = str(ScoreManager.score_dict[Active.chart][0])
