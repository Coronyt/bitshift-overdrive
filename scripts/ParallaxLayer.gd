extends Sprite

export(float) var speed = 0
export(int) var orig_x = 0
export(int) var orig_y = 0
export(bool) var one_shot

var this_chart : Node2D

func _ready():
	this_chart = self.get_parent().get_parent().get_parent()

func _physics_process(_delta):
	if not UserPreferences.prefs["disable_scrolling"] and not this_chart.paused:
		self.translate(Vector2(-speed, 0))
		if(self.global_transform.origin.x <= -640) and not one_shot:
			self.global_transform.origin = Vector2(orig_x, orig_y)
