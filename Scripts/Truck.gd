extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		body.is_near_truck = true


func _on_body_exited(body):
	if body.name == "Player":
		body.is_near_truck = false
