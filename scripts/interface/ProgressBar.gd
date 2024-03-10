extends TextureProgress

onready var flair_anims = self.get_parent().get_node("ChartCamera/ScoreCounter/FlairAnims")
onready var flair_label = self.get_parent().get_node("ChartCamera/ScoreCounter/FlairAnims/FlairLabel")

var landmark_25per = false
var landmark_50per = false
var landmark_75per = false

var milestone = 0
var milestone_cooldown = false

func _ready():
	Active.progress = 0
	if Active.is_byte:
		$HealthBar5.show()
	if Active.is_nybl:
		$HealthBar3.show()

func mile_25():
	if landmark_25per == false:
		landmark_25per = true
		flair_label.text = "25% COMPLETE!"
		flair_anims.play("landmark")
		$FlairSFX_Timer1.start()

func mile_50():
	if landmark_50per == false:
		landmark_50per = true
		flair_label.text = "50% COMPLETE!"
		flair_anims.play("landmark")
		$FlairSFX_Timer1.start()

func mile_75():
	if landmark_75per == false:
		landmark_75per = true
		flair_label.text = "ALMOST THERE!"
		flair_anims.play("landmark")
		$FlairSFX_Timer1.start()

func set_milestone(to_milestone):
	milestone = to_milestone

func _on_FlairAnims_animation_finished(anim_name):
	if anim_name == "landmark":
		pass

func _on_FlairSFX_Timer1_timeout():
	SoundManager.play_sound("flair1")

func _on_FlairSFX_Timer2_timeout():
	if milestone == 25:
		SoundManager.play_combo(1.15)
	elif milestone == 50:
		SoundManager.play_combo(1.25)
	elif milestone == 100:
		SoundManager.play_combo(1.35)
	elif milestone == 200:
		SoundManager.play_combo(1.45)
	if Active.is_byte and Active.health < 5:
		Active.health += 1
	elif Active.is_nybl and Active.health < 3:
		Active.health += 1

func _on_ComboAnimTimer_timeout():
	if milestone_cooldown == false:
		if milestone == 25:
			flair_label.text = "- 2x SCORE! -"
		elif milestone == 50:
			flair_label.text = "- 4x SCORE! -"
		elif milestone == 100:
			flair_label.text = "- 8x SCORE! -"
		elif milestone == 200:
			flair_label.text = "- 16x SCORE! -"
		flair_anims.play("landmark")
		milestone_cooldown = true
		$ComboCooldownTimer.start()

func _on_ComboCooldownTimer_timeout():
	milestone_cooldown = false
