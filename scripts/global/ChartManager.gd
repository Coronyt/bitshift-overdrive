extends Node

const spacedive = preload("res://scripts/charts/spacedive.gd")
const breeze = preload("res://scripts/charts/breeze.gd")
const coy_glance = preload("res://scripts/charts/coy_glance.gd")
const brighter = preload("res://scripts/charts/brighter.gd")
const baroque = preload("res://scripts/charts/baroque.gd")
const strato = preload("res://scripts/charts/strato.gd")
const devilcat = preload("res://scripts/charts/devilcat.gd")
const scarlet = preload("res://scripts/charts/scarlet.gd")
const moonlight = preload("res://scripts/charts/moonlight.gd")
const musashi = preload("res://scripts/charts/musashi.gd")
const isle = preload("res://scripts/charts/isle.gd")

var chart_dict = {
	"spacedive" : spacedive,
	"breeze" : breeze,
	"coy_glance" : coy_glance,
	"brighter" : brighter,
	"baroque" : baroque,
	"strato" : strato,
	"devilcat" : devilcat,
	"scarlet" : scarlet,
	"moonlight" : moonlight,
	"musashi" : musashi,
	"isle" : isle,
}

var chart_tscn_dict = {
	"spacedive" : "res://scenes/charts/spacedive.tscn",
	"breeze" : "res://scenes/charts/breeze.tscn",
	"coy_glance" : "res://scenes/charts/coy_glance.tscn",
	"brighter" : "res://scenes/charts/brighter.tscn",
	"baroque" : "res://scenes/charts/baroque.tscn",
	"strato" : "res://scenes/charts/strato.tscn",
	"devilcat" : "res://scenes/charts/devilcat.tscn",
	"scarlet" : "res://scenes/charts/scarlet.tscn",
	"moonlight" : "res://scenes/charts/moonlight.tscn",
	"musashi" : "res://scenes/charts/musashi.tscn",
	"isle" : "res://scenes/charts/isle.tscn",
}

func fetch_chart(chart_ID):
	if Active.is_easy == true:
		# return chart_easy_dict[chart_ID].chart
		pass
	return chart_dict[chart_ID].chart
	
func fetch_chart_tscn(chart_tscn_ID):
	return chart_tscn_dict[chart_tscn_ID]
