extends Control


var score = 0
var score_multiplier = 1
export (int) var upgrade_level = 1
onready var score_per_tick_label = $VBoxContainer/HBoxContainer/Score_Label


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello i was created! Hello guys i hope you are fine!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	add_to_score(get_score_value() * delta)
	score_per_tick_label.text =  str(round(score))
	$VBoxContainer/Upgrade_Cost.text = "Score Per Second/Click: " + str(get_score_value())
	$VBoxContainer/Score_Per_Tick.text = "Upgrade_Cost: " + str(get_upgrade_cost())
	$Achievement_Statistics_Label.text = str(Achievements.statistics)
	

func add_to_score(score_addition):
	Achievements.add_statistic("lifetime_score", score_addition)
	score+= score_addition
	

func _on_Button_pressed():
	Achievements.add_statistic("clicks", 1)
	add_to_score(get_score_value())

func get_score_value():
	var score_value = 1  * (score_multiplier * upgrade_level)
	return score_value

func get_upgrade_cost():
	#depends on upgrade_level
	var base_cost = 5
	return pow(base_cost, upgrade_level)

func _on_Upgrade_Button_pressed():
	# upgrade/pay for upgrade
	# check if i have enough score
	# if not display eror (or do nothing)
	# if i have, spend points and upgrade
	var upgrade_cost = get_upgrade_cost()
	if score < upgrade_cost:
		print("Not enough points to upgrade!")
		return
	score -= upgrade_cost
	print("Upgrade successful!")
	upgrade_level += 1





func save():
	var save_dict = {}
	save_dict["score"] = score
	
func load_state(save_dict):
	score = save_dict["score"]

func save_in_file():
	"user://save_game.save"
	pass

func load_in_file():
	pass
