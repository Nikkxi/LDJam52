extends CharacterBody2D


@export var SPEED = 300.0
@export var ROTATION_SPEED = 2
const JUMP_VELOCITY = -400.0

@onready var animation_player = get_node("AnimatedSprite2D")


func _ready():
	animation_player.play("MouseWalk")
	pass


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

	velocity = Vector2.ZERO

	move_and_slide()
