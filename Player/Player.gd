class_name Player extends CharacterBody2D
@export var move_speed: float = 500.0 ## Move speed in pixels per second
@onready var force_applied: Vector2 = Vector2.ZERO ## All external forces
@export var knockback_friction: float = 5.0 ## How fast the player slows down

static var instance: Player


enum VisionType {
  NONE,
  SUNGLASSES,
  IR,
}

func _init() -> void:
	instance = self
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	# normal movement input is not processed while rolling
	velocity = Input.get_vector("move_left", "move_right", "jump", "jump") * move_speed
	
	velocity += force_applied 	
	force_applied = force_applied.lerp(Vector2.ZERO, delta * knockback_friction)
	move_and_slide()
