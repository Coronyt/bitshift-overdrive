extends Control

const SCORE_PATH = "res://player/scoresheet.bso"
const TROPHY_PATH = "res://player/trophycase.bso"

func _ready():
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
		trophycase.close()
