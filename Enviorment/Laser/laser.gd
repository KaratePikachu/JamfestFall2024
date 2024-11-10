extends Area2D

@export var loop_time : int = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player.instance.glasses_changed.connect(_on_glasses_change)
	$Timer.wait_time = loop_time

func _on_body_entered(body: Node2D) -> void:
	print("AAAAAAAAAAAAAAAA")
	if body is Player:
		body.set_global_position(Vector2(0,0))
		
func _on_glasses_change(old_glasses: int, new_glasses: int) -> void:
	if(new_glasses == Player.Glasses.INFARED or new_glasses == Player.Glasses.NORMAL or new_glasses == Player.Glasses.DRONE):
		$ColorRect.visible = true
	else: 
		$ColorRect.visible = false


func _on_timer_timeout() -> void:
	$Shape.set_deferred("disabled", !$Shape.disabled)
	
	if $Shape.disabled:
		$ColorRect.self_modulate.a = 1
	else: 
		$ColorRect.self_modulate.a = 0.2
		
	
