extends Node

func update_score(track_key, new_score):
	# Adding the current score to the list
	score_dict[track_key].append(new_score)
	# Sorting the score list
	score_dict[track_key].sort()
	# Removing the lowest value
	score_dict[track_key].remove(0)

var score_dict = {
	"spacedive" : 	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	"breeze" : 		[0, 0, 0, 0, 0, 0, 0, 0, 0],
	"coy_glance" : 	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	"brighter" : 	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	"baroque" : 	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	"strato" : 		[0, 0, 0, 0, 0, 0, 0, 0, 0],
	"devilcat" : 	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	"scarlet" : 	[0, 0, 0, 0, 0, 0, 0, 0, 0],
	"moonlight" : 	[0, 0, 0, 0, 0, 0, 0, 0, 0],
}
