extends Node

# Track: Breeze in the Blackest Forest

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
	
	# Measure 3
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_09],
	["NOTE", 16, AXIS_09],
	["REST", 8],
	
	["NOTE", 16, AXIS_13],
	["REST", 8],
	
	["NOTE", 16, AXIS_12],
	["NOTE", 16, AXIS_10],
	["NOTE", 16, AXIS_11],
	["REST", 4],
	["REST", 16],
	
	# Measure 4
	["REST", 16],
	["NOTE", 32, AXIS_11],
	["NOTE", 32, AXIS_12],
	["NOTE", 8, AXIS_11],
	["REST", 16],
	["NOTE", 8, AXIS_10],
	["REST", 16],
	["NOTE", 2, AXIS_02],
	
	# Buffer
	["REST", 1],
	["REST", 1],
	["REST", 1],
	["REST", 1],
	
	# End
	["END"]
	
]
