extends Control

# BITSHIFT OVERDRIVE 1.0.0

const SCORE_PATH = "res://data1.bso"
const TROPHY_PATH = "res://data2.bso"

func _ready():
	# Engine.set_target_fps(60)
	load_scores()
	load_trophies()
	$CRT/Shader.hide()
	$FadeAnim.play("fade_in")
	SoundManager.play_sound("title1")

func _on_TitleAnim_animation_finished(anim_name):
	if anim_name == "Title1":
		SoundManager.play_sound("score1")
		$TitleAnim.play("Title2")
		$FadeAnim.play("flash")
		SoundManager.stop_sound("title2")
		SoundManager.play_sound("title3")
	if anim_name == "Title2":
		$CRT/Shader.show()
		$VaporScape.show()
		SoundManager.play_sound("score2")
		SoundManager.stop_sound("title1")
		SoundManager.stop_sound("title3")
		$VaporCam.speed = -0.15
		$TitlePortal.show()
		$ExitPortal.show()
		$ReleaseLabel.show()
		SoundManager.play_sound("title_track")

func _on_FadeAnim_animation_finished(anim_name):
	if anim_name == "fade_in":
		$TitleAnim.play("Title1")
		SoundManager.play_sound("title2")

func load_scores():
	var scoresheet = File.new()
	var error = scoresheet.open(SCORE_PATH, File.READ)
	if not error == OK:
		scoresheet.close()
	else:
		ScoreManager.score_dict["baroque"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["breeze"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["brighter"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["coy_glance"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["devilcat"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["moonlight"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["scarlet"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["spacedive"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["strato"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["musashi"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["isle"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["kraken"] = str2var(scoresheet.get_line())
		ScoreManager.score_dict["cirrus"] = str2var(scoresheet.get_line())
		scoresheet.close()

func load_trophies():
	var trophycase = File.new()
	var error = trophycase.open(TROPHY_PATH, File.READ)
	if not error == OK:
		trophycase.close()
	else:
		TrophyManager.trophy_dict["baroque"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["breeze"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["brighter"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["coy_glance"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["devilcat"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["moonlight"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["scarlet"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["spacedive"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["strato"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["musashi"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["isle"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["kraken"] = str2var(trophycase.get_line())
		TrophyManager.trophy_dict["cirrus"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["baroque"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["breeze"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["brighter"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["coy_glance"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["devilcat"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["moonlight"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["scarlet"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["spacedive"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["strato"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["musashi"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["isle"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["kraken"] = str2var(trophycase.get_line())
		TrophyManager.trophy_queues["cirrus"] = str2var(trophycase.get_line())
		trophycase.close()
