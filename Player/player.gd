class_name Player extends CharacterBody2D

const WALK_FORCE = 2000
const WALK_MAX_SPEED = 450
const STOP_FORCE = 1800
const JUMP_SPEED = 1000

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


static var obtained_glasses = []
static var worn_glasses = Glasses.NONE

signal glasses_changed(old_glasses : Glasses, new_glasses : Glasses)

func _init() -> void:
	instance = self
	
func _ready() -> void:
	grant_glasses(Glasses.NONE)
	

func _input(event: InputEvent) -> void:
	var desired_switch = null
	
	if event.is_action_pressed("unequip"):
		desired_switch = Glasses.NONE
	elif event.is_action_pressed("equip_sunglasses"):
		desired_switch = Glasses.SUNGLASSES
	elif event.is_action_pressed("equip_infared"):
		desired_switch = Glasses.INFARED
	elif event.is_action_pressed("equip_smart"):
		desired_switch = Glasses.SMART
	elif event.is_action_pressed("equip_drone"):
		desired_switch = Glasses.DRONE
	elif event.is_action_pressed("equip_lidar"):
		desired_switch = Glasses.LIDAR
	elif event.is_action_pressed("equip_normal"):
		desired_switch = Glasses.NORMAL
	elif event.is_action_pressed("equip_kaleidoscope"):
		desired_switch = Glasses.KALEIDOSCOPE
	elif event.is_action_pressed("equip_monocle"):
		desired_switch = Glasses.MONOCLE
	
	
	
	if desired_switch != null and obtained_glasses.has(desired_switch):
		switch_glasses(desired_switch)
		
		

func grant_glasses(new_glasses):
	if !obtained_glasses.has(new_glasses):
		obtained_glasses.append(new_glasses)
	else:
		printerr("Player: d:
	instance = selfError! player already has these glasses")
		
	
	switch_glasses(new_glasses)
	
	
func switch_glasses(new_glasses):
	print(new_glasses)
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
