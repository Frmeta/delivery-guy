extends Node2D

var desired_package = 0 # will be overwritten by gamemanager

func _ready():
	want_package()
	
func gain_package():
	$Particle.emitting = true
	$Bubble.visible = false
	
	await get_tree().create_timer(3).timeout
	
	want_package()
	
	
func want_package():
	$Bubble.visible = true

func set_package_to(idx):
	desired_package = idx
	$"Bubble/Desired Package".region_rect.position = Vector2(desired_package * 16,0)

func _on_body_entered(body):
	if body.name == "Player":
		body.nearby_recipient = self


func _on_body_exited(body):
	if body.name == "Player":
		body.nearby_recipient = null
