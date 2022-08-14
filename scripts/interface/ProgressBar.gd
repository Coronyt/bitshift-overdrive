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
		print("is_byte")
	if Active.is_nybl:
		$HealthBar3.show()
		print("is_nybl")

func _physics_process(_delta):
	self.value = Active.progress
	# 'Quarter' landmark.
	if stepify(Active.progress, 0.01) == 0.25:
		if landmark_25per == false:
			landmark_25per = true
			flair_label.text = "25% COMPLETE!"
			flair_anims.play("landmark")
			$FlairSFX_Timer1.start()
	# 'Halfway' landmark.
	if stepify(Active.progress, 0.01) == 0.50:
		if landmark_50per == false:
			landmark_50per = true
			flair_label.text = "50% COMPLETE!"
			flair_anims.play("landmark")
			$FlairSFX_Timer1.start()
	# 'Almost' landmark.
	if stepify(Active.progress, 0.01) == 0.75:
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
	SoundManager.play_flair1()

func _on_FlairSFX_Timer2_timeout():
	if milestone == 25:
		SoundManager.play_combo(1.15)
	elif milestone == 50:
		SoundManager.play_combo(1.25)
	elif milestone == 100:
		SoundManager.play_combo(1.35)
	elif milestone == 200:
		SoundManager.play_combo(1.45)
	elif milestone == 300:
		SoundManager.play_combo(1.55)
	elif milestone == 400:
		SoundManager.play_combo(1.65)
	elif milestone == 500:
		SoundManager.play_combo(1.75)

func _on_ComboAnimTimer_timeout():
	if milestone_cooldown == false:
		if milestone == 25:
			flair_label.text = "1.25x SCORE!"
		elif milestone == 50:
			flair_label.text = "1.50x SCORE!"
		elif milestone == 100:
			flair_label.text = "2.00x SCORE!"
		elif milestone == 200:
			flair_label.text = "2.50x SCORE!"
		elif milestone == 300:
			flair_label.text = "3.00x SCORE!"
		elif milestone == 400:
			flair_label.text = "4.00x SCORE!"
		elif milestone == 500:
			flair_label.text = "5.00x SCORE!"
		flair_anims.play("landmark")
		milestone_cooldown = true
		$ComboCooldownTimer.start()

func _on_ComboCooldownTimer_timeout():
	milestone_cooldown = false
