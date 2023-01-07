extends CharacterBody2D


@export var SPEED = 300.0
@export var ROTATION_SPEED = 2
const JUMP_VELOCITY = -400.0

@onready var animation_player = get_node("AnimatedSprite2D")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


#func _process(delta):
#
#	if Input.is_action_just_pressed("ui_cancel"):
#		get_tree().quit()
#
#	velocity = Vector2(0,0)
#
#	var turn = Input.get_axis("ui_left", "ui_right")
#	#print_debug("Rotation $turn @ Delta $delta")
#	var forward = Input.get_axis("ui_up", "ui_down")
#	#print_debug("Forward " + forward + " @ Delta " + delta)
#
#	var isWalking = false
#
#	if turn:
#		# Rotate
#		rotate(turn * ROTATION_SPEED * delta)
#		isWalking = true
#
#	if forward:
#		# Move Forward
#
#		isWalking = true
#
#	if (isWalking == false):
#		animation_player.stop()
#	else:
#		animation_player.play("CatWalk")
#
#	move_and_collide(velocity)


func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

	var isWalking = false

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

	var forward = Input.get_axis("ui_down", "ui_up")
	var rotate_player = Input.get_axis("ui_left", "ui_right")

	if rotate_player:
		rotate(rotate_player * ROTATION_SPEED * delta)
		isWalking = true
		
	if forward:
		transform.origin += transform.y * (forward * SPEED)
		isWalking = true
		
	if isWalking:
		animation_player.play("CatWalk")
	else:
		animation_player.stop()

	move_and_slide()
