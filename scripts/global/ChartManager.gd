extends Node

const spacedive = preload("res://scripts/charts/spacedive.gd")
const coy_glance = preload("res://scripts/charts/coy_glance.gd")
const brighter = preload("res://scripts/charts/brighter.gd")
const baroque = preload("res://scripts/charts/baroque.gd")
const strato = preload("res://scripts/charts/strato.gd")
const devilcat = preload("res://scripts/charts/devilcat.gd")
const scarlet = preload("res://scripts/charts/scarlet.gd")
const moonlight = preload("res://scripts/charts/moonlight.gd")
const musashi = preload("res://scripts/charts/musashi.gd")
const isle = preload("res://scripts/charts/isle.gd")
const kraken = preload("res://scripts/charts/kraken.gd")
const cirrus = preload("res://scripts/charts/cirrus.gd")

var chart_dict = {
	"spacedive" : spacedive,
	"coy_glance" : coy_glance,
	"brighter" : brighter,
	"baroque" : baroque,
	"strato" : strato,
	"devilcat" : devilcat,
	"scarlet" : scarlet,
	"moonlight" : moonlight,
	"musashi" : musashi,
	"isle" : isle,
	"kraken" : kraken,
	"cirrus" : cirrus,
}

var chart_tscn_dict = {
	"spacedive" : "res://scenes/charts/spacedive.tscn",
	"coy_glance" : "res://scenes/charts/coy_glance.tscn",
	"brighter" : "res://scenes/charts/brighter.tscn",
	"baroque" : "res://scenes/charts/baroque.tscn",
	"strato" : "res://scenes/charts/strato.tscn",
	"devilcat" : "res://scenes/charts/devilcat.tscn",
	"scarlet" : "res://scenes/charts/scarlet.tscn",
	"moonlight" : "res://scenes/charts/moonlight.tscn",
	"musashi" : "res://scenes/charts/musashi.tscn",
	"isle" : "res://scenes/charts/isle.tscn",
	"kraken" : "res://scenes/charts/kraken.tscn",
	"cirrus" : "res://scenes/charts/cirrus.tscn",
}

func fetch_chart(chart_ID):
	return chart_dict[chart_ID].chart
	
func fetch_chart_tscn(chart_tscn_ID):
	return chart_tscn_dict[chart_tscn_ID]
