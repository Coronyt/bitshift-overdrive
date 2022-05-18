extends Area2D

func _physics_process(_delta):
	for coll in self.get_overlapping_bodies():
		coll.shatter()
		coll.get_child(1).set_disabled(true)
		coll.get_child(4).queue_free() # Deleting light node.
		coll.get_child(0).get_child(0).queue_free() # Deleting outline.
		coll.get_child(0).get_child(1).emitting = false # Stopping particles.
		Active.active.erase(coll)
		Active.score += 50
		score_flair()
		self.get_parent().transform.origin.y = 280 # To negate paddle pushing.
		
func score_flair():
	var score_label = self.get_parent().get_parent().get_child(3).get_child(2)
	var score_timer = self.get_parent().get_parent().get_child(3).get_child(3)
	var label_bb = "[shake rate=25 level=15][center]"
	score_label.bbcode_text = label_bb + str(Active.score)
	score_timer.start()
