class_name Player extends CharacterBody2D

const WALK_FORCE = 600
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
const JUMP_SPEED = 200

static var instance : Player

@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


enum Glasses {
	NONE,
	SUNGLASSES,
	INFARED,
	SMART,
	DRONE,
	LIDAR,
	NORMAL,
	KALEIDOSCOPE,
	MONOCLE
} 

static var worn_glasses = Glasses.NONE

signal glasses_changed(old_glasses : Glasses, new_glasses : Glasses)

func _init() -> void:
	instance = self

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_1):
		put_on_glasses(Glasses.SUNGLASSES)
	pass
	
func put_on_glasses(new_glasses):
	glasses_changed.emit(worn_glasses,new_glasses)
	
func _on_glasses_changed(old_glasses: int, new_glasses: int) -> void:
	self.worn_glasses = new_glasses
	pass # Replace with function body.

func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_axis(&"move_left", &"move_right"))
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	# TODO: This information should be set to the CharacterBody properties instead of arguments: snap, Vector2.DOWN, Vector2.UP
	# TODO: Rename velocity to linear_velocity in the rest of the script.
	move_and_slide()

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed(&"jump"):
		velocity.y = -JUMP_SPEED
