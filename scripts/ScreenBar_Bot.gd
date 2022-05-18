extends Area2D

func _physics_process(_delta):
	for coll in self.get_overlapping_bodies():
		SoundManager.play_miss()
		# Active.clear()
		Active.combo = 0
		coll.queue_free() # Missed note delay currently disabled.
		self.get_parent().get_parent().get_parent().check_health()
