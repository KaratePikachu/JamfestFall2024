extends StaticBody2D

@export var open := false
@export var color := Color(0,0,0)

func _on_ready() -> void:
	$DoorSprite.color = color

# Called when the node enters the scene tree for the first time.
func _on_triggered() -> void:
	print("WAHHHHHHHH")
	open = !open
	if(open):
		$DoorSprite.modulate.a = 100
		$CollisionArea.set_deferred("disabled", true)
	else:
		$DoorSprite.modulate.a = 20
		$CollisionArea.set_deferred("disabled", false)
		
	
