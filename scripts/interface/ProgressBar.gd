extends TextureProgress

onready var flair_anims = self.get_parent().get_node("ChartCamera/ScoreCounter/FlairAnims")
onready var flair_label = self.get_parent().get_node("ChartCamera/ScoreCounter/FlairAnims/FlairLabel")

var landmark_25per = false
var landmark_50per = false
var landmark_75per = false

func _ready():
	pass

func _physics_process(_delta):
	self.value = Active.progress
	# 'Quarter' landmark.
	if stepify(Active.progress, 0.01) == 0.25:
		if landmark_25per == false:
			landmark_25per = true
			flair_label.text = "25% COMPLETE!"
			flair_anims.play("landmark")
	# 'Halfway' landmark.
	if stepify(Active.progress, 0.01) == 0.50:
		if landmark_50per == false:
			landmark_50per = true
			flair_label.text = "50% COMPLETE!"
			flair_anims.play("landmark")
	# 'Almost' landmark.
	if stepify(Active.progress, 0.01) == 0.75:
		if landmark_75per == false:
			landmark_75per = true
			flair_label.text = "ALMOST THERE!"
			flair_anims.play("landmark")
