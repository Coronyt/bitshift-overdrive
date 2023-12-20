extends Node

# Track: Voyage of the Kraken

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
	
	# Measure 1
	["REST", 1],
	["REST", 1],
	
	# Measure 3
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 8, AXIS_12],
	["NOTE", 8, AXIS_12],
	
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	["NOTE", 4, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 8, AXIS_06],
	["NOTE", 8, AXIS_05],
	
	# Measure 5
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 8, AXIS_12],
	["NOTE", 8, AXIS_12],
	
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_13],
	["NOTE", 4, AXIS_11],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_09],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_06],
	
	["NOTE", 8, AXIS_07],
	["NOTE", 8, AXIS_02],
	
	# Measure 7
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 8, AXIS_12],
	["NOTE", 8, AXIS_12],
	
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	["NOTE", 4, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 8, AXIS_06],
	["NOTE", 8, AXIS_05],
	
	# Measure 9
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 8, AXIS_12],
	["NOTE", 8, AXIS_12],
	
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_13],
	["NOTE", 4, AXIS_11],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_09],
	
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_06],
	
	["NOTE", 8, AXIS_07],
	["NOTE", 8, AXIS_02],
	
	# Measure 11
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 8, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 8, AXIS_11],
	["NOTE", 8, AXIS_08],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_16],
	
	["NOTE", 16, AXIS_17],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_14],
	
	["NOTE", 4, AXIS_13],
	
	# Measure 13
	["NOTE", 8, AXIS_14],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_14],
	
	["NOTE", 8, AXIS_14],
	["NOTE", 8, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 8, AXIS_11],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 8, AXIS_09],
	["NOTE", 8, AXIS_10],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_06],
	["NOTE", 8, AXIS_04],
	
	["NOTE", 8, AXIS_03],
	["NOTE", 16, AXIS_03],
	["NOTE", 16, AXIS_04],
	
	["NOTE", 8, AXIS_03],
	["NOTE", 8, AXIS_01],
	
	# Measure 15
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 8, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 8, AXIS_11],
	["NOTE", 8, AXIS_08],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_16],
	
	["NOTE", 16, AXIS_17],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_14],
	
	["NOTE", 4, AXIS_13],
	
	# Measure 17
	["NOTE", 8, AXIS_14],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_14],
	
	["NOTE", 8, AXIS_14],
	["NOTE", 8, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 8, AXIS_11],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 8, AXIS_09],
	["NOTE", 8, AXIS_10],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_06],
	["NOTE", 8, AXIS_04],
	
	["NOTE", 8, AXIS_03],
	["NOTE", 16, AXIS_03],
	["NOTE", 16, AXIS_04],
	
	["NOTE", 8, AXIS_03],
	["NOTE", 8, AXIS_01],
	
	# Measure 19
	["NOTE", 8, AXIS_12],
	["REST", 16],
	["NOTE", 4, AXIS_11],
	["REST", 16],
	
	["REST", 8],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 8, AXIS_14],
	["NOTE", 8, AXIS_13],
	
	["NOTE", 8, AXIS_12],
	["REST", 16],
	["NOTE", 4, AXIS_11],
	["REST", 16],
	
	["REST", 8],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 8, AXIS_14],
	["NOTE", 8, AXIS_13],
	
	# Measure 21
	["NOTE", 8, AXIS_15],
	["REST", 16],
	["NOTE", 8, AXIS_11],
	["REST", 16],
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 8, AXIS_11],
	["NOTE", 8, AXIS_11],
	["REST", 16],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	
	["NOTE", 4, AXIS_13],
	["REST", 16],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	["NOTE", 8, AXIS_12],
	["REST", 16],
	["NOTE", 8, AXIS_10],
	["REST", 16],
	["NOTE", 8, AXIS_11],
	
	# Measure 23
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_15],
	
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 8, AXIS_15],
	["REST", 16],
	["NOTE", 16, AXIS_15],
	
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_11],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_15],
	
	["REST", 16],
	["REST", 16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 8, AXIS_14],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_12],
	
	["REST", 16],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_12],
	
	# Measure 25
	["REST", 16],
	["NOTE", 16, AXIS_13],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_13],
	
	["REST", 16],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_13],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_08],
	
	["REST", 16],
	["NOTE", 8, AXIS_09],
	["REST", 16],
	
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_06],
	
	["REST", 8],
	["NOTE", 16, AXIS_05],
	["NOTE", 16, AXIS_06],
	
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_06],
	["NOTE", 16, AXIS_04],
	["NOTE", 16, AXIS_02],
	
	["REST", 8],
	["NOTE", 16, AXIS_03],
	["NOTE", 16, AXIS_05],
	
	# Measure 27
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 8, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 8, AXIS_11],
	["NOTE", 8, AXIS_08],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_16],
	
	["NOTE", 16, AXIS_17],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_14],
	
	["NOTE", 4, AXIS_13],
	
	# Measure 29
	["NOTE", 8, AXIS_14],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_14],
	
	["NOTE", 8, AXIS_14],
	["NOTE", 8, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 8, AXIS_11],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 8, AXIS_09],
	["NOTE", 8, AXIS_10],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_06],
	["NOTE", 8, AXIS_04],
	
	["NOTE", 8, AXIS_03],
	["NOTE", 16, AXIS_03],
	["NOTE", 16, AXIS_04],
	
	["NOTE", 8, AXIS_03],
	["NOTE", 8, AXIS_01],
	
	# Measure 31
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 8, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 8, AXIS_11],
	["NOTE", 8, AXIS_08],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_15],
	
	["NOTE", 8, AXIS_15],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_16],
	
	["NOTE", 16, AXIS_17],
	["NOTE", 16, AXIS_16],
	["NOTE", 16, AXIS_15],
	["NOTE", 16, AXIS_14],
	
	["NOTE", 4, AXIS_13],
	
	# Measure 33
	["NOTE", 8, AXIS_14],
	["NOTE", 16, AXIS_14],
	["NOTE", 16, AXIS_14],
	
	["NOTE", 8, AXIS_14],
	["NOTE", 8, AXIS_11],
	
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_11],
	["NOTE", 16, AXIS_10],
	
	["NOTE", 8, AXIS_11],
	["NOTE", 16, AXIS_07],
	["NOTE", 16, AXIS_08],
	
	["NOTE", 8, AXIS_09],
	["NOTE", 8, AXIS_10],
	["NOTE", 16, AXIS_08],
	["NOTE", 16, AXIS_06],
	["NOTE", 8, AXIS_04],
	
	["NOTE", 8, AXIS_03],
	["NOTE", 16, AXIS_03],
	["NOTE", 16, AXIS_04],
	
	["NOTE", 8, AXIS_03],
	["NOTE", 8, AXIS_01],
	
	# Measure 35
	
	# Buffer
	["REST", 1],
	["REST", 1],
	
	# End
	["END"]
	
]
