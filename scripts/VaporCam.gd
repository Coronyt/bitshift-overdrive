extends Camera

export(float) var speed = 0

func _physics_process(_delta):
	self.translate(Vector3(0, 0, speed))
	if(self.global_transform.origin.z >= 80):
		self.global_transform.origin = Vector3(0, 1, 0)
