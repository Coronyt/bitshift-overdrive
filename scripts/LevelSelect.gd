extends Control

const SCORE_PATH = "res://data1.bso"
const TROPHY_PATH = "res://data2.bso"

const cinematic_label = preload("res://scenes/cinematic/LabelTitle.tscn")
export var cinematic = false
var preview_playing = false

func _ready():
	save_scores()
	save_trophies()
	load_last_modifiers()
	SoundManager.play_sound("track_select")
	if cinematic == true:
		for element in self.get_children():
			if element.name == "VaporCam":
				break
			element.hide()
		# var new_cinematic_label = cinematic_label.instance()
		# self.add_child(new_cinematic_label)
	
func load_last_modifiers():
	for mod in $SpeedLabel.get_children():
		if mod.name != Active.mod_speed:
			mod.pressed = false
		else:
			mod.pressed = true
	for mod in $DifLabel1.get_children():
		if mod.name != Active.mod_dif_1:
			mod.pressed = false
		else:
			mod.pressed = true
	for mod in $DifLabel2.get_children():
		if mod.name != Active.mod_dif_2:
			mod.pressed = false
		else:
			mod.pressed = true

func load_into_active():
	var act_chart_bkup_1 = Active.chart
	var act_chart_bkup_2 = Active.chart_name
	Active.refresh()
	Active.chart = act_chart_bkup_1
	Active.chart_name = act_chart_bkup_2
	var to_load_speed = $SpeedLabel/speed_100.group.get_pressed_button().name
	var to_load_dif1 = $DifLabel1/underclock.group.get_pressed_button().name
	var to_load_dif2 = $DifLabel2/classic.group.get_pressed_button().name
	# Storing last used modifiers.
	Active.mod_speed = to_load_speed
	Active.mod_dif_1 = to_load_dif1
	Active.mod_dif_2 = to_load_dif2
	Active.speed = to_load_speed
	if to_load_speed == "speed_090":
		Active.is_090 = true
	if to_load_speed == "speed_110":
		Active.is_110 = true
	if to_load_dif1 == "underclock":
		Active.is_easy = false
	if to_load_dif1 == "overdrive":
		Active.is_easy = false
	if to_load_dif1 == "segfault":
		Active.is_easy = false
	if to_load_dif2 == "arcade":
		Active.is_byte = true
	if to_load_dif2 == "ironbit":
		Active.is_iron = true

func save_scores():
	var new_scoresheet = File.new()
	new_scoresheet.open(SCORE_PATH, File.WRITE)
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["baroque"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["breeze"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["brighter"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["coy_glance"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["devilcat"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["moonlight"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["scarlet"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["spacedive"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["strato"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["musashi"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["isle"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["kraken"]))
	new_scoresheet.store_line(var2str(ScoreManager.score_dict["cirrus"]))
	new_scoresheet.close()

func save_trophies():
	var new_trophycase = File.new()
	new_trophycase.open(TROPHY_PATH, File.WRITE)
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["baroque"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["breeze"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["brighter"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["coy_glance"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["devilcat"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["moonlight"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["scarlet"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["spacedive"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["strato"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["musashi"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["isle"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["kraken"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_dict["cirrus"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["baroque"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["breeze"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["brighter"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["coy_glance"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["devilcat"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["moonlight"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["scarlet"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["spacedive"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["strato"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["musashi"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["isle"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["kraken"]))
	new_trophycase.store_line(var2str(TrophyManager.trophy_queues["cirrus"]))
	new_trophycase.close()
