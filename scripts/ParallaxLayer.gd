extends Sprite

export(float) var speed = 0
export(int) var orig_x = 0
export(int) var orig_y = 0

func _physics_process(_delta):
	if not UserPreferences.prefs["disable_scrolling"]:
		self.translate(Vector2(-speed, 0))
		if(self.global_transform.origin.x <= -640):
			self.global_transform.origin = Vector2(orig_x, orig_y)
