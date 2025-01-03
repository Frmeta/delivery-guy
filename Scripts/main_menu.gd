extends Node2D

const save_path := "user://highscore.dat"

func _ready():
	$CanvasLayer/HiScoreLabel.text = "High Score: " + str(load_hi())
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/delivery_game.tscn")

func load_hi():
	var file = FileAccess.open(save_path, FileAccess.READ)
	if file == null:
		return 0
	var high_score = file.get_64()
	file.close()
	return high_score
