extends Node

func award_trophies():
	award_trophy_1()
	award_trophy_2()
	award_trophy_3()
	award_trophy_4()
	award_trophy_5()

var trophy_dict = {
	"spacedive" : 	[0, 0, 0, 0, 0],
	"breeze" : 		[0, 0, 0, 0, 0],
	"coy_glance" : 	[0, 0, 0, 0, 0],
	"brighter" : 	[0, 0, 0, 0, 0],
	"baroque" : 	[0, 0, 0, 0, 0],
	"strato" : 		[0, 0, 0, 0, 0],
	"devilcat" : 	[0, 0, 0, 0, 0],
	"scarlet" : 	[0, 0, 0, 0, 0],
	"moonlight" : 	[0, 0, 0, 0, 0],
	"musashi" : 	[0, 0, 0, 0, 0],
	"isle" : 		[0, 0, 0, 0, 0],
	"kraken" : 		[0, 0, 0, 0, 0],
	"cirrus" : 		[0, 0, 0, 0, 0],
}

var trophy_queues = {
	"spacedive" : 	[],
	"breeze" : 		[],
	"coy_glance" : 	[],
	"brighter" : 	[],
	"baroque" : 	[],
	"strato" : 		[],
	"devilcat" : 	[],
	"scarlet" : 	[],
	"moonlight" : 	[],
	"musashi" : 	[],
	"isle" : 		[],
	"kraken" : 		[],
	"cirrus" : 		[],
}

func sum_trophies():
	var trophy_sum = 0
	for t_array in trophy_dict.values():
		for t in t_array:
			trophy_sum += t
	return trophy_sum

func award_trophy_1():
	# Complete track with any difficulty settings
	if trophy_dict[Active.chart][0] == 0:
		# Awarding trophies
		trophy_dict[Active.chart][0] = 1
		trophy_queues[Active.chart].append(1)
	else: pass

func award_trophy_2():
	# Complete track on at least arcade mode
	if trophy_dict[Active.chart][1] == 0:
		# Check active chart parameters
		if Active.mod_dif_2 == "arcade":
			# Awarding trophies
			trophy_dict[Active.chart][0] = 1
			trophy_dict[Active.chart][1] = 1
			trophy_queues[Active.chart].append(2)
	else: pass

func award_trophy_3():
	# Complete track on ironbit mode
	if trophy_dict[Active.chart][2] == 0:
		# Check active chart parameters
		if Active.mod_dif_2 == "ironbit":
			# Awarding trophies
			trophy_dict[Active.chart][0] = 1
			trophy_dict[Active.chart][1] = 1
			trophy_dict[Active.chart][2] = 1
			trophy_queues[Active.chart].append(2)
			trophy_queues[Active.chart].append(3)
	else: pass

func award_trophy_4():
	# Complete track on arcade, and on at least overdrive and at least on speed 100%
	if trophy_dict[Active.chart][3] == 0:
		# Check active chart parameters
		if (Active.mod_dif_2 == "arcade") and (Active.mod_dif_1 == "overdrive"
		or Active.mod_dif_1 == "segfault") and (Active.mod_speed != "speed_090"):
			trophy_dict[Active.chart][0] = 1
			trophy_dict[Active.chart][1] = 1
			trophy_dict[Active.chart][3] = 1
			trophy_queues[Active.chart].append(4)
	else: pass

func award_trophy_5():
	# Complete track on ironbit, and on at least overdrive and at least on speed 100%
	if trophy_dict[Active.chart][4] == 0:
		if (Active.mod_dif_2 == "ironbit") and (Active.mod_dif_1 == "overdrive"
		or Active.mod_dif_1 == "segfault") and (Active.mod_speed != "speed_090"):
			trophy_dict[Active.chart][0] = 1
			trophy_dict[Active.chart][1] = 1
			trophy_dict[Active.chart][2] = 1
			trophy_dict[Active.chart][3] = 1
			trophy_dict[Active.chart][4] = 1
			trophy_queues[Active.chart].append(4)
			trophy_queues[Active.chart].append(5)
		pass
	else: pass
