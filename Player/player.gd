class_name Player extends CharacterBody2D

const WALK_FORCE = 2000
const WALK_MAX_SPEED = 450
const STOP_FORCE = 1800
const JUMP_SPEED = 1000

const CAMERA_SPEED = 10
var freecam_pos : Vector2 = Vector2(0,0)

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
@export var worn_glasses = Glasses.NONE

signal glasses_changed(old_glasses : Glasses, new_glasses : Glasses)

func _init() -> void:
	if(instance == null):
		instance = self
	
func _ready() -> void:
	instance = self
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
	glasses_changed.emit(worn_glasses,new_glasses)	
	
func _on_glasses_changed(old_glasses: int, new_glasses: int) -> void:
	if(old_glasses == Glasses.DRONE):
		$Camera2D.position = Vector2(0,0)
		$Camera2D.zoom = Vector2(1, 1)
	
	self.worn_glasses = new_glasses
	pass # Replace with function body.

func _physics_process(delta):
	if worn_glasses == Glasses.DRONE:
		var screen_size = get_viewport_rect().size
		
		if Input.is_action_pressed("move_right"):
			$Camera2D.position.x += CAMERA_SPEED
		if Input.is_action_pressed("move_left"):
			$Camera2D.position.x -= CAMERA_SPEED

		$Camera2D.position.y = -300
		$Camera2D.zoom = Vector2(0.95, 0.95)
		
	else:
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

		
		#State Machine. It does magic.
		if !is_on_floor() && velocity.y < 0:
			$AnimPlayer.play("drone_jump")
		elif !is_on_floor() && velocity.y >= -10:
			$AnimPlayer.play("drone_fall")
		elif abs(velocity.x) >= 10:
			_run_run_animation(velocity.x >= 10)
		else:
			_run_idle_animation($GuySprite.flip_h)
		

		# Check for jumping. is_on_floor() must be called after movement code.
		if is_on_floor() and Input.is_action_just_pressed(&"jump"):
			velocity.y = -JUMP_SPEED
		
func die() -> void:
	switch_glasses(Glasses.NONE)
	get_tree().reload_current_scene()
	
func _run_run_animation(going_left:bool) -> void:
	$GuySprite.flip_h = going_left

	match worn_glasses:
		Glasses.DRONE:
			$AnimPlayer.play("drone_run")
		Glasses.INFARED:
			$AnimPlayer.play("infared_run")
		Glasses.NONE:
			$AnimPlayer.play("no_glasses_run")
		Glasses.NORMAL:
			$AnimPlayer.play("normal_run")
		Glasses.SUNGLASSES:
			$AnimPlayer.play("sunglasses_run")

func _run_idle_animation(going_left:bool) -> void:
	$GuySprite.flip_h = going_left

	match worn_glasses:
		Glasses.DRONE:
			$AnimPlayer.play("drone_idle")
		Glasses.INFARED:
			$AnimPlayer.play("infared_idle")
		Glasses.NONE:
			$AnimPlayer.play("no_glasses_idle")
		Glasses.NORMAL:
			$AnimPlayer.play("normal_idle")
		Glasses.SUNGLASSES:
			$AnimPlayer.play("sunglasses_idle")

func _run_jump_animation(going_left:bool) -> void:
	$GuySprite.flip_h = going_left

	match worn_glasses:
		Glasses.DRONE:
			$AnimPlayer.play("drone_idle")
		Glasses.INFARED:
			$AnimPlayer.play("infared_idle")
		Glasses.NONE:
			$AnimPlayer.play("no_glasses_idle")
		Glasses.NORMAL:
			$AnimPlayer.play("normal_idle")
		Glasses.SUNGLASSES:
			$AnimPlayer.play("sunglasses_idle")
