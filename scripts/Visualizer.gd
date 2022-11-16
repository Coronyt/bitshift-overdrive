extends Node2D

const FREQ_MAX = 11050.0
const MIN_DB = 60

const VU_COUNT = 19
const WIDTH = (1280 - 64)
const HEIGHT = 300

var res_w = 1280
var aud_spectrum

func _draw():
	var w = WIDTH / VU_COUNT
	var prev_hz = 0
	for i in range(0, VU_COUNT):
		var hz = i * FREQ_MAX / VU_COUNT;
		var magnitude: float = aud_spectrum.get_magnitude_for_frequency_range(prev_hz, hz).length()
		var energy = clamp((MIN_DB + linear2db(magnitude)) / MIN_DB, 0, 1)
		var height = energy * HEIGHT
		var center_ref = (res_w / 2) - (WIDTH / 2)
		var rect_U = Rect2((w * i) + center_ref + 4, HEIGHT - height, w - 8, height)
		var rect_D = Rect2((w * i) + center_ref + 4, HEIGHT - height, w - 8, height)
		rect_U.position.y = rect_U.position.y + 85
		rect_D.position.y = (720 / 2) + 25
		draw_rect(rect_U, Color(1.0, 1.0, 1.0, 0.2))
		draw_rect(rect_D, Color(1.0, 1.0, 1.0, 0.2))
		prev_hz = hz

func _process(_delta):
	if self.get_parent().get_parent().paused == false:
		if self.get_parent().get_parent().tracking == true:
			update()

func _ready():
	if UserPreferences.prefs["disable_visualizer"]:
		self.queue_free()
	aud_spectrum = AudioServer.get_bus_effect_instance(0,0)
