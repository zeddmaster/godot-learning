extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	applyGravity(delta)
	handleMove()
	handleJump()

	move_and_slide()


func applyGravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
func handleJump():
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("Jump")


func handleMove():
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = (direction == -1)
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		if is_on_floor():
			$AnimatedSprite2D.play("Idle")
		




