extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if get_tree().paused:
		text = " Pause "
		get_tree().paused = false
	else:
		text = "Continue"
		get_tree().paused = true
