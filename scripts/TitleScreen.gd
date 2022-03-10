extends Control

func _ready():
	$CRT/Shader.hide()
	$FadeAnim.play("fade_in")
	SoundManager.play_title1()

func _on_TitleAnim_animation_finished(anim_name):
	if anim_name == "Title1":
		SoundManager.play_score1()
		$TitleAnim.play("Title2")
		$FadeAnim.play("flash")
		SoundManager.stop_title2()
		SoundManager.play_title3()
	if anim_name == "Title2":
		$CRT/Shader.show()
		$VaporScape.show()
		SoundManager.play_score2()
		SoundManager.stop_title1()
		SoundManager.stop_title3()
		$VaporCam.speed = -0.15
		$TitlePortal.show()
		$ExitPortal.show()
		$ReleaseLabel.show()
		SoundManager.play_title_track()

func _on_FadeAnim_animation_finished(anim_name):
	if anim_name == "fade_in":
		$TitleAnim.play("Title1")
		SoundManager.play_title2()
