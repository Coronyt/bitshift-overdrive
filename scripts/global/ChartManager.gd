extends Node

const spacedive = preload("res://scripts/charts/spacedive.gd")
const breeze = preload("res://scripts/charts/breeze.gd")
const coy_glance = preload("res://scripts/charts/coy_glance.gd")
const brighter = preload("res://scripts/charts/brighter.gd")
const baroque = preload("res://scripts/charts/baroque.gd")
const strato = preload("res://scripts/charts/strato.gd")

var chart_dict = {
	"spacedive" : spacedive,
	"breeze" : breeze,
	"coy_glance" : coy_glance,
	"brighter" : brighter,
	"baroque" : baroque,
	"strato" : strato,
}

var chart_tscn_dict = {
	"spacedive" : "res://scenes/charts/spacedive.tscn",
	"breeze" : "res://scenes/charts/breeze.tscn",
	"coy_glance" : "res://scenes/charts/coy_glance.tscn",
	"brighter" : "res://scenes/charts/brighter.tscn",
	"baroque" : "res://scenes/charts/baroque.tscn",
	"strato" : "res://scenes/charts/strato.tscn",
}

func fetch_chart(chart_ID):
	if Active.is_easy == true:
		# return chart_easy_dict[chart_ID].chart
		pass
	return chart_dict[chart_ID].chart
	
func fetch_chart_tscn(chart_tscn_ID):
	return chart_tscn_dict[chart_tscn_ID]
