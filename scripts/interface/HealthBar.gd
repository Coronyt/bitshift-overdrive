extends TextureProgress

func _ready():
	if Active.is_byte:
		Active.health = 5
		self.max_value = 5
	elif Active.is_nybl:
		Active.health = 3
		self.max_value = 3

func _physics_process(_delta):
	self.value = Active.health
