extends Timer

func _on_TrackListTimer_timeout():
	self.get_parent().get_child(2).fade_in_bgm()
