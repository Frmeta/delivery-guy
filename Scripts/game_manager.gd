extends Node2D


var game_over_msec = 0
const save_path := "user://highscore.dat"
const game_time = 60

func _ready():
	
	# init recipients
	var recipients = get_tree().get_nodes_in_group("recipient")
	var desired_packages = range(0, 4)
	desired_packages.shuffle()
	for i in range(4):
		recipients[i].set_package_to(desired_packages[i])
		
	
	# init timer
	$CanvasLayer/TimerLabel.text = "Timer: " + str(game_time)
	game_over_msec = Time.get_ticks_msec() + game_time * 1000
	
	
func _process(delta):
	$CanvasLayer/TimerLabel.text = "Timer: " + str(floor((game_over_msec - Time.get_ticks_msec())/1000))
	if Time.get_ticks_msec() >= game_over_msec:
		save_hi(max($Player.point, load_hi()))
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func save_hi(content):
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_64(content)
	file.close()
	print("success save " + str(content))
  

func load_hi():
	var file = FileAccess.open(save_path, FileAccess.READ)
	if file == null:
		return 0
	var high_score = file.get_64()
	file.close()
	return high_score
