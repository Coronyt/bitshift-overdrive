extends Area2D

func _physics_process(_delta):
	for coll in self.get_overlapping_bodies():
		SoundManager.play_miss()
		Active.clear()
		self.get_parent().get_parent().get_parent().check_health()
