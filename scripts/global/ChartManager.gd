extends Node

const spacedive = preload("res://scripts/charts/spacedive.gd")
const breezy = preload("res://scripts/charts/breezy.gd")
const feelingcoy = preload("res://scripts/charts/feelingcoy.gd")
const brightside = preload("res://scripts/charts/brightside.gd")
const bachjam = preload("res://scripts/charts/bachjam.gd")
const stratofly = preload("res://scripts/charts/stratofly.gd")

const spacedive_uc = preload("res://scripts/charts/spacedive_uc.gd")
const breezy_uc = preload("res://scripts/charts/breezy_uc.gd")
const feelingcoy_uc = preload("res://scripts/charts/feelingcoy_uc.gd")
const brightside_uc = preload("res://scripts/charts/brightside_uc.gd")
const bachjam_uc = preload("res://scripts/charts/bachjam_uc.gd")
const stratofly_uc = preload("res://scripts/charts/stratofly_uc.gd")

var chart_dict = {
	"spacedive" : spacedive,
	"breezy" : breezy,
	"feelingcoy" : feelingcoy,
	"brightside" : brightside,
	"bachjam" : bachjam,
	"stratofly" : stratofly,
}

var chart_easy_dict = {
	"spacedive" : spacedive_uc,
	"breezy" : breezy_uc,
	"feelingcoy" : feelingcoy_uc,
	"brightside" : brightside_uc,
	"bachjam" : bachjam_uc,
	"stratofly" : stratofly,
}

var chart_tscn_dict = {
	"spacedive" : "res://scenes/charts/spacedive.tscn",
	"breezy" : "res://scenes/charts/breezy.tscn",
	"feelingcoy" : "res://scenes/charts/feelingcoy.tscn",
	"brightside" : "res://scenes/charts/brightside.tscn",
	"bachjam" : "res://scenes/charts/bachjam.tscn",
	"stratofly" : "res://scenes/charts/stratofly.tscn",
}

func fetch_chart(chart_ID):
	if Active.is_easy == true:
		return chart_easy_dict[chart_ID].chart
	return chart_dict[chart_ID].chart
	
func fetch_chart_tscn(chart_tscn_ID):
	return chart_tscn_dict[chart_tscn_ID]
