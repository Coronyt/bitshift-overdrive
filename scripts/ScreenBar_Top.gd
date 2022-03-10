extends Area2D

func _physics_process(_delta):
	for coll in self.get_overlapping_bodies():
		if coll.name == "ChartEnd":
			coll.queue_free()
			self.get_parent().get_child(5).play("FadeAnim")
		if Active.active.has(coll) == false:
			Active.active.append(coll)
