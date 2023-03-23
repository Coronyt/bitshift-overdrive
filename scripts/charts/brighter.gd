extends Node

# Track: It's Brighter on the Other Side

const AXIS_01 = 0064
const AXIS_02 = 0128
const AXIS_03 = 0192
const AXIS_04 = 0256
const AXIS_05 = 0320
const AXIS_06 = 0384
const AXIS_07 = 0448
const AXIS_08 = 0512
const AXIS_09 = 0576
const AXIS_10 = 0640
const AXIS_11 = 0704
const AXIS_12 = 0768
const AXIS_13 = 0832
const AXIS_14 = 0896
const AXIS_15 = 0960
const AXIS_16 = 1024
const AXIS_17 = 1088
const AXIS_18 = 1152
const AXIS_19 = 1216

const chart = [
	
	# Buffer
	["REST", 1],
	["REST", 1],
	["REST", 1],
	["REST", 1],
	
	# Measure 5
	["NOTE", 8, AXIS_08],
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_12],
	
	["NOTE", 16, AXIS_14],
	["NOTE", 8, AXIS_12],
	["NOTE", 8, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_12],
	
	["NOTE", 8, AXIS_08],
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_12],
	
	["NOTE", 16, AXIS_14],
	["NOTE", 8, AXIS_12],
	["NOTE", 8, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_12],
	
	["NOTE", 8, AXIS_06],
	["NOTE", 8, AXIS_08],
	["NOTE", 8, AXIS_10],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 8, AXIS_08],
	["NOTE", 8, AXIS_10],
	
	["NOTE", 8, AXIS_06],
	["NOTE", 8, AXIS_08],
	["NOTE", 8, AXIS_10],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 8, AXIS_08],
	["NOTE", 8, AXIS_10],
	
	# Measure 9
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	
	# Measure 11
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	# Measure 13
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	
	# Measure 15
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_08],
	
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	# Measure 16
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["REST", 16],
	
	# Measure 17
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	
	# Measure 19
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	# Measure 21
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	
	# Measure 23
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_08],
	
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	# Measure 24
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["REST", 16],
	
	# Measure 25
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 2, AXIS_08],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 4, AXIS_08],
	["REST", 8],
	["NOTE", 16, AXIS_07],
	["NOTE", 4, AXIS_08],
	["REST", 16],
	["NOTE", 8, AXIS_11],
	["REST", 16],
	["NOTE", 32, AXIS_10],
	["NOTE", 32, AXIS_09],
	
	# Measure 27
	["NOTE", 4, AXIS_08],
	["REST", 8],
	["NOTE", 4, AXIS_07],
	["REST", 8],
	["NOTE", 4, AXIS_06],
	
	["NOTE", 4, AXIS_05],
	["REST", 8],
	["NOTE", 4, AXIS_02],
	["REST", 8],
	["NOTE", 4, AXIS_03],
	
	# Measure 29
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 2, AXIS_08],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 4, AXIS_08],
	["REST", 16],
	["REST", 64],
	["NOTE", 64, AXIS_13],
	["NOTE", 64, AXIS_14],
	["NOTE", 64, AXIS_15],
	["NOTE", 4, AXIS_16],
	["REST", 8],
	["NOTE", 4, AXIS_15],
	
	# Measure 31
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_15],
	["REST", 16],
	["NOTE", 2, AXIS_10],
	["REST", 4],
	["REST", 32],
	["NOTE", 64, AXIS_10],
	["NOTE", 64, AXIS_09],
	["NOTE", 2, AXIS_08],
	["NOTE", 4, AXIS_06],
	["NOTE", 4, AXIS_10],
	
	# Measure 33
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 2, AXIS_08],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 4, AXIS_08],
	["REST", 8],
	["NOTE", 16, AXIS_07],
	["NOTE", 4, AXIS_08],
	["REST", 16],
	["NOTE", 8, AXIS_11],
	["REST", 16],
	["NOTE", 32, AXIS_10],
	["NOTE", 32, AXIS_09],
	
	# Measure 35
	["NOTE", 4, AXIS_08],
	["REST", 8],
	["NOTE", 4, AXIS_07],
	["REST", 8],
	["NOTE", 4, AXIS_06],
	
	["NOTE", 4, AXIS_05],
	["REST", 8],
	["NOTE", 4, AXIS_02],
	["REST", 8],
	["NOTE", 4, AXIS_03],
	
	# Measure 37
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 2, AXIS_08],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 4, AXIS_08],
	["REST", 16],
	["REST", 64],
	["NOTE", 64, AXIS_13],
	["NOTE", 64, AXIS_14],
	["NOTE", 64, AXIS_15],
	["NOTE", 4, AXIS_16],
	["REST", 8],
	["NOTE", 4, AXIS_15],
	
	# Measure 39
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_15],
	["REST", 16],
	["NOTE", 2, AXIS_10],
	["REST", 4],
	["REST", 32],
	["NOTE", 64, AXIS_10],
	["NOTE", 64, AXIS_09],
	["NOTE", 2, AXIS_08],
	["NOTE", 4, AXIS_06],
	["NOTE", 4, AXIS_10],
	
	# Measure 41
	["NOTE", 8, AXIS_13],
	["NOTE", 8, AXIS_06],
	["REST", 8],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_11],
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_09],
	
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	["NOTE", 4, AXIS_12],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	["NOTE", 4, AXIS_12],
	["REST", 4],
	
	# Measure 43
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	# Measure 45
	["REST", 16],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_06],
	["REST", 16],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_06],
	["REST", 16],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	
	# Measure 47
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["REST", 16],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["REST", 16],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["REST", 16],
	["NOTE", 16, AXIS_16],
	
	# Measure 48
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["REST", 16],
	
	["NOTE", 16, AXIS_17],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_16],
	
	["NOTE", 16, AXIS_14],
	["REST", 16],
	["NOTE", 16, AXIS_13],
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["REST", 16],
	["NOTE", 16, AXIS_11],
	["REST", 16],
	
	# Measure 49
	["NOTE", 1, AXIS_18],
	["REST", 2],
	["REST", 4],
	
	["NOTE", 16, AXIS_19],
	["NOTE", 32, AXIS_18],
	["NOTE", 32, AXIS_17],
	["NOTE", 8, AXIS_16],
	
	# Measure 51
	["REST", 1],
	["NOTE", 2, AXIS_14],
	["NOTE", 4, AXIS_13],
	["NOTE", 4, AXIS_12],
	
	# Measure 53
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	["REST", 16],
	
	["NOTE", 8, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 2, AXIS_12],
	["REST", 16],
	
	["NOTE", 8, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 2, AXIS_11],
	["REST", 16],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 8, AXIS_09],
	["NOTE", 4, AXIS_05],
	["REST", 16],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 8, AXIS_09],
	["NOTE", 4, AXIS_06],
	["REST", 16],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_09],
	["REST", 16],
	["NOTE", 8, AXIS_06],
	
	# Measure 57
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 2, AXIS_08],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 4, AXIS_08],
	["REST", 8],
	["NOTE", 16, AXIS_07],
	["NOTE", 4, AXIS_08],
	["REST", 16],
	["NOTE", 8, AXIS_11],
	["REST", 16],
	["NOTE", 32, AXIS_10],
	["NOTE", 32, AXIS_09],
	
	# Measure 59
	["NOTE", 4, AXIS_08],
	["REST", 8],
	["NOTE", 4, AXIS_07],
	["REST", 8],
	["NOTE", 4, AXIS_06],
	
	["NOTE", 4, AXIS_05],
	["REST", 8],
	["NOTE", 4, AXIS_02],
	["REST", 8],
	["NOTE", 4, AXIS_03],
	
	# Measure 61
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 2, AXIS_08],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 4, AXIS_08],
	["REST", 16],
	["REST", 64],
	["NOTE", 64, AXIS_13],
	["NOTE", 64, AXIS_14],
	["NOTE", 64, AXIS_15],
	["NOTE", 4, AXIS_16],
	["REST", 8],
	["NOTE", 4, AXIS_15],
	
	# Measure 63
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_15],
	["REST", 16],
	["NOTE", 2, AXIS_10],
	["REST", 4],
	["REST", 32],
	["NOTE", 64, AXIS_10],
	["NOTE", 64, AXIS_09],
	["NOTE", 2, AXIS_08],
	["NOTE", 4, AXIS_06],
	["NOTE", 4, AXIS_10],
	
	# Measure 65
	["NOTE", 8, AXIS_13],
	["NOTE", 8, AXIS_06],
	["REST", 8],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_11],
	["NOTE", 8, AXIS_10],
	["NOTE", 8, AXIS_09],
	
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	["NOTE", 4, AXIS_12],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	["NOTE", 4, AXIS_12],
	["REST", 4],
	
	# Measure 67
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	# Measure 69
	["REST", 16],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_06],
	["REST", 16],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_06],
	["REST", 16],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	
	# Measure 71
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_12],
	["REST", 16],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["REST", 16],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["REST", 16],
	["NOTE", 16, AXIS_16],
	
	# Measure 72
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["REST", 16],
	
	["NOTE", 16, AXIS_17],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_16],
	
	["NOTE", 16, AXIS_14],
	["REST", 16],
	["NOTE", 16, AXIS_13],
	["REST", 16],
	["NOTE", 16, AXIS_12],
	["REST", 16],
	["NOTE", 16, AXIS_11],
	["REST", 16],
	
	# Measure 73
	["NOTE", 1, AXIS_18],
	["REST", 1],
	
	# End
	["END"]
	
]
