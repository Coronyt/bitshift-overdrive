extends ColorRect

onready var trophy_0_sprite = preload("res://assets/sprites/trophy_0.stex")
onready var trophy_1_sprite = preload("res://assets/sprites/trophy_1.stex")
onready var trophy_2_sprite = preload("res://assets/sprites/trophy_2.stex")
onready var trophy_3_sprite = preload("res://assets/sprites/trophy_3.stex")
onready var trophy_4_sprite = preload("res://assets/sprites/trophy_4.stex")
onready var trophy_5_sprite = preload("res://assets/sprites/trophy_5.stex")

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
	display_trophies()

func display_trophies():
	if TrophyManager.trophy_dict[Active.chart][0] == 1:
		$TrophyCase/Trophy1.texture = trophy_1_sprite
	else: $TrophyCase/Trophy1.texture = trophy_0_sprite
	if TrophyManager.trophy_dict[Active.chart][1] == 1:
		$TrophyCase/Trophy2.texture = trophy_2_sprite
	else: $TrophyCase/Trophy2.texture = trophy_0_sprite
	if TrophyManager.trophy_dict[Active.chart][2] == 1:
		$TrophyCase/Trophy3.texture = trophy_3_sprite
	else: $TrophyCase/Trophy3.texture = trophy_0_sprite
	if TrophyManager.trophy_dict[Active.chart][3] == 1:
		$TrophyCase/Trophy4.texture = trophy_4_sprite
	else: $TrophyCase/Trophy4.texture = trophy_0_sprite
	if TrophyManager.trophy_dict[Active.chart][4] == 1:
		$TrophyCase/Trophy5.texture = trophy_5_sprite
	else: $TrophyCase/Trophy5.texture = trophy_0_sprite
