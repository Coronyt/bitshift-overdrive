extends Label

func _physics_process(_delta):
	if Active.combo < 25:
		self.text = "1x"
	elif Active.combo < 50:
		self.text = "2x"
	elif Active.combo < 100:
		self.text = "4x"
	elif Active.combo < 200:
		self.text = "8x"
	else: # >= 200
		self.text = "16x"
