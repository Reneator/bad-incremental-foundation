extends Node


#var statistics = {10: "Hello!", "achievement_1" : 5}
var statistics = {"clicks": 0, "lifetime_score": 0}

var clicks_achievement = {1: {}}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func add_statistic(key, value):
	if not statistics.has(key):
		statistics[key] = value
		return
	else:
		statistics[key] += value

func get_multiplier():
	return 2
