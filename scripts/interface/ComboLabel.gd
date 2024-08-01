extends Label

var curr : int

func _process(_delta):
	curr = Active.combo
	if curr < 25:
		self.text = "1x"
	elif curr < 50:
		self.text = "2x"
	elif curr < 100:
		self.text = "4x"
	elif curr < 200:
		self.text = "8x"
	else: # >= 200
		self.text = "16x"
