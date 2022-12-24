extends KinematicBody2D

onready var NoteShatter = preload("res://scenes/objects/NoteShatter.tscn")
onready var ComboTick = preload("res://scenes/objects/ComboTick.tscn")

onready var prog_bar = self.get_parent().get_parent().get_node(
	"ChartTracker/ProgressBar")
onready var sfx_timer = self.get_parent().get_parent().get_node(
	"ChartTracker/ProgressBar/FlairSFX_Timer2")
onready var anim_timer = self.get_parent().get_parent().get_node(
	"ChartTracker/ProgressBar/ComboAnimTimer")
onready var flair_anims = self.get_parent().get_parent().get_node(
	"ChartTracker/ChartCamera/ScoreCounter/FlairAnims")
onready var flair_label = self.get_parent().get_parent().get_node(
	"ChartTracker/ChartCamera/ScoreCounter/FlairAnims/FlairLabel")

func fade():
	$NoteColl.disabled = true
	$NoteSprite.hide()
	
func milestone_check():
	if Active.combo == 25:
		Active.last_milestone = 25
		return 25
	if Active.combo == 50:
		Active.last_milestone = 50
		return 50
	if Active.combo == 100:
		Active.last_milestone = 100
		return 100
	if Active.combo == 200:
		Active.last_milestone = 200
		return 200
	return 0

func tick():
	var tick = ComboTick.instance()
	# Alternate combo tick spawns from right to left.
	if Active.combo_LR == false:
		tick.global_position = Vector2(self.global_position.x + 97.5, self.global_position.y - 25)
		Active.combo_LR = true
	else:
		tick.global_position = Vector2(self.global_position.x - 97.5, self.global_position.y - 25)
		Active.combo_LR = false
	self.get_parent().add_child(tick)
	var milestone_check_res = milestone_check()
	if milestone_check_res != 0:
		flair_label.text = "- " + str(milestone_check_res) + " COMBO! -"
		flair_anims.play("landmark")
		sfx_timer.start()
		anim_timer.start()
		prog_bar.set_milestone(milestone_check_res)

func shatter():
	var shatter = NoteShatter.instance()
	shatter.global_position = self.global_position
	self.get_parent().add_child(shatter)
	shatter.get_child(0).emitting = true
	$NoteShader/SSDissolveBurn.play(0.1)
	Active.combo += 1
	tick()
	if Active.last_milestone == 0:
		Active.score += stepify((50 * 1.00), 1)
	elif Active.last_milestone == 25:
		Active.score += stepify((50 * 1.25), 1)
	elif Active.last_milestone == 50:
		Active.score += stepify((50 * 1.50), 1)
	elif Active.last_milestone == 100:
		Active.score += stepify((50 * 2.00), 1)
	elif Active.last_milestone == 200:
		Active.score += stepify((50 * 2.50), 1)

func _physics_process(_delta):
	if self.get_parent().get_parent().tracking == false:
		self.queue_free()
	if self.get_parent().get_parent().paused == false:
		self.move_and_slide(Vector2(0, 1) * self.get_parent().get_parent().speed)
