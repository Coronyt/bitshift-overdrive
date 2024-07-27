extends Area2D
		
func score_flair():
	var score_label = self.get_parent().get_parent().get_child(3).get_child(2)
	var score_timer = self.get_parent().get_parent().get_child(3).get_child(3)
	var label_bb = "[shake rate=25 level=15][center]"
	score_label.bbcode_text = label_bb + str(Active.score)
	score_timer.start()

func _on_PaddleArea_body_entered(coll):
	if coll:
		if coll.get_child(0).name == "NoteSprite":
			coll.shatter()
			if coll:
				if coll.get_child(4):
					coll.get_child(4).queue_free() # Deleting light node
			if coll:
				if coll.get_child(0):
					if coll.get_child(0).get_child(0):
						coll.get_child(0).get_child(0).queue_free() # Deleting outline
			if coll:
				if coll.get_child(0):
					if coll.get_child(0).get_child(1):
						coll.get_child(0).get_child(1).emitting = false # Stopping particles
			# if coll:
				# if coll.get_child(0):
					# if coll.get_child(0).get_child(2):
						# coll.get_child(0).get_child(2).play("fade") # Fading out particles
			Active.active.erase(coll)
			score_flair()
			self.get_parent().transform.origin.y = 280 # To negate paddle pushing
