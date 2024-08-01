extends Area2D

func _on_ScreenBar_Top_body_entered(coll):
	if coll:
		if coll.get_child(0).name == "NoteSprite":
			if coll.name == "ChartEnd":
				coll.queue_free()
				self.get_parent().get_child(5).play("FadeAnim")
			if Active.active.has(coll) == false:
				Active.active.append(coll)
