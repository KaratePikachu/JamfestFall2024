extends CharacterBody2D

# -1 for left, 1 for right
@export var direction : int = 1
@export var speed : int = 80

func _ready() -> void:
	Player.instance.glasses_changed.connect(_on_glasses_change)
	
func _on_glasses_change(old_glasses: int, new_glasses: int) -> void:
	if(new_glasses == Player.Glasses.INFARED or new_glasses == Player.Glasses.NORMAL or new_glasses == Player.Glasses.DRONE):
		$Sprite.visible = true
	else: 
		$Sprite.visible = false
	
func _physics_process(delta: float) -> void:
	velocity.x = speed * direction * 0.7
	velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity")
	move_and_slide()
	
	$LeftDownRaycast.force_raycast_update()
	$RightDownRaycast.force_raycast_update()
	$RightRightRaycast.force_raycast_update()
	$LeftLeftRaycast.force_raycast_update()	

	if !$LeftDownRaycast.is_colliding() && direction == -1:
			direction = 1;
			$Sprite.scale.x *= -1
			
	if $LeftLeftRaycast.is_colliding() && direction == -1:
			direction = 1;
			$Sprite.scale.x *= -1
			
	if !$RightDownRaycast.is_colliding() && direction == 1:
			direction = -1;
			$Sprite.scale.x *= -1
	if $RightRightRaycast.is_colliding() && direction == 1:
			direction = -1;
			$Sprite.scale.x *= -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		


func _on_aura_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
