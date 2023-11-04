extends RigidBody2D

const WALK_SPEED = 500
const STOP_FORCE = 1300
const JUMP_SPEED = 600
const EPSILON = .1

@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# # Horizontal movement code. First, get the player's input.
	# var walk = WALK_FORCE * (Input.get_axis(&"move_left", &"move_right"))
	# # Slow down the player if they're not trying to move.
	# if abs(walk) < WALK_FORCE * 0.2:
	# 	# The velocity, slowed down a bit, and then reassigned.
	# 	velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	# else:
	# 	velocity.x += walk * delta
	# # Clamp to the maximum horizontal movement speed.
	# velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
	var walk_speed = WALK_SPEED * (Input.get_axis(&"move_left", &"move_right"))
	
	# Vertical movement code. Apply gravity.
	# velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	# TODO: This information should be set to the CharacterBody properties instead of arguments: snap, Vector2.DOWN, Vector2.UP
	# TODO: Rename velocity to linear_velocity in the rest of the script.
	# move_and_slide()
	print(linear_velocity)

	# Check for jumping. is_on_floor() must be called after movement code.
	if abs(linear_velocity.y) < EPSILON and Input.is_action_just_pressed(&"jump"):
		set_axis_velocity(Vector2(walk_speed, -JUMP_SPEED))
	else:
		set_axis_velocity(Vector2(walk_speed, 0))
