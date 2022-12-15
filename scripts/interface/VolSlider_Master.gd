extends HSlider

onready var bus = AudioServer.get_bus_index("Master")

func _ready():
	self.value = UserPreferences.prefs["master_vol"]

func _on_VolSlider1_value_changed(value):
	UserPreferences.prefs["master_vol"] = value
	AudioServer.set_bus_volume_db(bus, value)
	if value == -30.0:
		AudioServer.set_bus_mute(bus, true)
	else:
		AudioServer.set_bus_mute(bus, false)
