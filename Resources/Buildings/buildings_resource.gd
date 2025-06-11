extends Resource

##====================================================
# README: 
#
#
#
##====================================================

class_name BuildingsResource

@export var building_name : String = ""

@export var amount : int = 0 :
	set(value):
		amount = value
		GetNextCost()
		GetNextCPS()
		CheckForMultiplier()

var cps : float = 0
@export var base_cps : float = 0

var cps_multiplier : float = 0
@export var cps_multiplier_dict : Dictionary[int, int] = {
	0 : 1,
	25 : 2,
	50 : 3,
	75 : 4,
	100 : 5,}

@export var base_cost : float = 0
var next_cost : float = 0

@export var rate_of_cost_growth : float = 0

func UpdateValues() -> void:
	GetNextCost()
	GetNextCPS()
	CheckForMultiplier()

# $cost_{next} = cost_{base} \times (rate_{growth})^{owned}$
func GetNextCost():
	next_cost = base_cost * pow(rate_of_cost_growth, amount)
	print()

# production_{total} = (production_{base} \times owned) \times multipliers$
func GetNextCPS():
	cps = base_cps * amount * cps_multiplier
	print()

func CheckForMultiplier():
	if cps_multiplier_dict.get(amount) == null:
		return
	cps_multiplier = cps_multiplier_dict.get(amount)