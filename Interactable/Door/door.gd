extends StaticBody2D

@export var open := false
@export var color : Color

func _on_ready() -> void:
	$DoorSprite.color = color
# Called when the node enters the scene tree for the first time.
func _on_triggered() -> void:
	print("WAHHHHHHHH")
	open = !open
	if(open):
		$DoorSprite.self_modulate.a = 0.2
		$CollisionArea.set_deferred("disabled", true)
	else:
		$DoorSprite.self_modulate.a = 1.0
		$CollisionArea.set_deferred("disabled", false)
		
	
