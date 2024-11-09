extends Area2D

@export var loop_time : int = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = loop_time

func _on_body_entered(body: Node2D) -> void:
	print("AAAAAAAAAAAAAAAA")
	if body is Player:
		body.set_global_position(Vector2(0,0))


func _on_timer_timeout() -> void:
	$Shape.set_deferred("disabled", !$Shape.disabled)
	
	if $Shape.disabled:
		$Shape/ColorRect.self_modulate.a = 1
	else: 
		$Shape/ColorRect.self_modulate.a = 0.2
		
	
