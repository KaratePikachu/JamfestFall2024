extends CharacterBody2D

# -1 for left, 1 for right
@export var direction : int = 1
@export var speed : int = 80

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#pass # Replace with function body.
	
func _physics_process(delta: float) -> void:
	velocity.x = speed * direction
	velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity")
	move_and_slide()
	
	$LeftDownRaycast.force_raycast_update()
	$RightDownRaycast.force_raycast_update()
	$RightRightRaycast.force_raycast_update()
	$LeftLeftRaycast.force_raycast_update()	

	if !$LeftDownRaycast.is_colliding() && direction == -1:
			direction = 1;
			
	if $LeftLeftRaycast.is_colliding() && direction == -1:
			direction = 1;
			
	if !$RightDownRaycast.is_colliding() && direction == 1:
			direction = -1;
	if $RightRightRaycast.is_colliding() && direction == 1:
			direction = -1;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		


func _on_aura_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
