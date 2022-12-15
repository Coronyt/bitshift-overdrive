extends Control

const cinematic_label = preload("res://scenes/cinematic/LabelTitle.tscn")
export var cinematic = false

func _ready():
	load_last_modifiers()
	SoundManager.play_sound("track_select")
	if cinematic == true:
		for element in self.get_children():
			if element.name == "VaporCam":
				break
			element.hide()
		# var new_cinematic_label = cinematic_label.instance()
		# self.add_child(new_cinematic_label)
	
func load_last_modifiers():
	for mod in $SpeedLabel.get_children():
		if mod.name != Active.mod_speed:
			mod.pressed = false
		else:
			mod.pressed = true
	for mod in $DifLabel1.get_children():
		if mod.name != Active.mod_dif_1:
			mod.pressed = false
		else:
			mod.pressed = true
	for mod in $DifLabel2.get_children():
		if mod.name != Active.mod_dif_2:
			mod.pressed = false
		else:
			mod.pressed = true

func load_into_active():
	var act_chart_bkup_1 = Active.chart
	var act_chart_bkup_2 = Active.chart_name
	Active.refresh()
	Active.chart = act_chart_bkup_1
	Active.chart_name = act_chart_bkup_2
	var to_load_speed = $SpeedLabel/SpeedButton1.group.get_pressed_button().name
	var to_load_dif1 = $DifLabel1/DifButton1.group.get_pressed_button().name
	var to_load_dif2 = $DifLabel2/DifButton3.group.get_pressed_button().name
	# Storing last used modifiers.
	Active.mod_speed = to_load_speed
	Active.mod_dif_1 = to_load_dif1
	Active.mod_dif_2 = to_load_dif2
	Active.speed = to_load_speed
	if to_load_speed == "SpeedButton1":
		Active.is_slow = true
	if to_load_speed == "SpeedButton3":
		Active.is_fast = true
	if to_load_dif1 == "DifButton0":
		Active.is_easy = true
	if to_load_dif1 == "DifButton1":
		Active.is_easy = true
	if to_load_dif1 == "DifButton2":
		Active.is_easy = false
	if to_load_dif1 == "DifButton3":
		Active.is_easy = false
	if to_load_dif2 == "DifButtonX": # Byte
		Active.is_byte = true
	if to_load_dif2 == "DifButtonY": # Nybble
		Active.is_nybl = true
	if to_load_dif2 == "DifButton4": # Ironbit
		Active.is_iron = true
