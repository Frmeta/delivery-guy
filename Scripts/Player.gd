extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -200.0

var is_near_truck = false
var nearby_recipient
var point = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")

	move_and_slide()
	
	# pikcup package
	if is_near_truck and Input.is_action_just_pressed("ui_accept"):
		if $Packages.idx == -1:
			$Packages.show_package(randi_range(0, 3))
			$pickup.play()
			
	# give package to recipient
	if nearby_recipient != null and Input.is_action_just_pressed("ui_accept"):
		if nearby_recipient.desired_package == $Packages.idx: # check if it matches with desired
			print("give package")
			nearby_recipient.gain_package()
			point += 1
			$"../CanvasLayer/ScoreLabel".text = "Score: " + str(point);
			$Packages.hide_package()
			$deliver.play()
		else:
			print("wrong package")
