extends Node

const chart_1 = preload("res://scripts/charts/Chart_1.gd")
const chart_2 = preload("res://scripts/charts/Chart_2.gd")
const chart_3 = preload("res://scripts/charts/Chart_3.gd")
const chart_4 = preload("res://scripts/charts/Chart_4.gd")
const chart_5 = preload("res://scripts/charts/Chart_5.gd")
const chart_6 = preload("res://scripts/charts/Chart_6.gd")
const chart_7 = preload("res://scripts/charts/Chart_7.gd")
const chart_9 = preload("res://scripts/charts/Chart_9.gd")
const chart_15 = preload("res://scripts/charts/Chart_15.gd")

const chart_1_easy = preload("res://scripts/charts/Chart_1_Easy.gd")
const chart_2_easy = preload("res://scripts/charts/Chart_2_Easy.gd")
const chart_3_easy = preload("res://scripts/charts/Chart_3_Easy.gd")
const chart_4_easy = preload("res://scripts/charts/Chart_4_Easy.gd")
const chart_5_easy = preload("res://scripts/charts/Chart_5_Easy.gd")
const chart_6_easy = preload("res://scripts/charts/Chart_6_Easy.gd")
const chart_7_easy = preload("res://scripts/charts/Chart_7_Easy.gd")
const chart_9_easy = preload("res://scripts/charts/Chart_9_Easy.gd")
const chart_15_easy = preload("res://scripts/charts/Chart_15_Easy.gd")

var chart_dict = {
	"Track_1" : chart_1,
	"Track_2" : chart_2,
	"Track_3" : chart_3,
	"Track_4" : chart_4,
	"Track_5" : chart_5,
	"Track_6" : chart_6,
	"Track_7" : chart_7,
	"Track_9" : chart_9,
	"Track_15" : chart_15,
}

var chart_easy_dict = {
	"Track_1" : chart_1_easy,
	"Track_2" : chart_2_easy,
	"Track_3" : chart_3_easy,
	"Track_4" : chart_4_easy,
	"Track_5" : chart_5_easy,
	"Track_6" : chart_6_easy,
	"Track_7" : chart_7_easy,
	"Track_9" : chart_9_easy,
	"Track_15" : chart_15_easy,
}

var chart_tscn_dict = {
	"Track_1" : "res://scenes/charts/Chart_1.tscn",
	"Track_2" : "res://scenes/charts/Chart_2.tscn",
	"Track_3" : "res://scenes/charts/Chart_3.tscn",
	"Track_4" : "res://scenes/charts/Chart_4.tscn",
	"Track_5" : "res://scenes/charts/Chart_5.tscn",
	"Track_6" : "res://scenes/charts/Chart_6.tscn",
	"Track_7" : "res://scenes/charts/Chart_7.tscn",
	"Track_9" : "res://scenes/charts/Chart_9.tscn",
	"Track_15" : "res://scenes/charts/Chart_15.tscn",
}

func fetch_chart(chart_ID):
	if Active.is_easy == true:
		return chart_easy_dict[chart_ID].chart
	return chart_dict[chart_ID].chart
	
func fetch_chart_tscn(chart_tscn_ID):
	return chart_tscn_dict[chart_tscn_ID]
