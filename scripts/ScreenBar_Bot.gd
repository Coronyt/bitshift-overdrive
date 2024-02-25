extends Area2D

func _on_ScreenBar_Bot_body_entered(coll):
	if coll:
		if coll.get_child(0).name == "NoteSprite":
			if not coll.shattered:
				SoundManager.play_sound("miss")
				if Active.is_byte or Active.is_nybl:
					Active.health -= 1
				self.get_parent().get_parent().get_parent().check_health()
				Active.combo = 0
				Active.last_milestone = 0
				coll.queue_free()
