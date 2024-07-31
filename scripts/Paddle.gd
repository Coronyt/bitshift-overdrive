extends KinematicBody2D

const paddle_XS = preload("res://assets/sprites/paddle_XS.stex")
const paddle_XL = preload("res://assets/sprites/paddle_XL.stex")

var locked = false

func _ready():
	# Calculating puck offset
	offset = 5.30
	if OS.window_fullscreen:
		offset = offset * (float(1920) / OS.get_screen_size().x)
	else:
		offset = offset * (float(1920) / get_viewport_rect().size.x)
	if Active.mod_dif_1 == "underclock":
		$PaddleIcon.texture = paddle_XL
		$PaddleArea/TopColl.scale = Vector2(2, 1)
	if Active.mod_dif_1 == "segfault":
		$PaddleIcon.texture = paddle_XS
		$PaddleArea/TopColl.scale = Vector2(0.35, 1)
	get_viewport().warp_mouse(Vector2(self.global_position.x, self.global_position.y))

var offset = 0.0

func _physics_process(_delta):
	if locked == false:
		var new_pos = get_global_mouse_position() - self.global_position
		new_pos.x = get_local_mouse_position().x
		move_and_slide(Vector2((new_pos.x + offset) * 50, 0))
		# '(new_pos.x + offset) * sense' where 'sense' is mouse sensitivity
		self.get_parent().get_parent().get_parent().paddle_pos_y = self.global_position.y
		get_viewport().warp_mouse(Vector2(get_global_mouse_position().x, self.global_position.y + 10))
