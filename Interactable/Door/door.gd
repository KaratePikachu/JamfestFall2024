extends StaticBody2D

@export var open := false

func _ready() -> void:
	pass
# Called when the node enters the scene tree for the first time.


func _on_switch_triggered() -> void:
	print("WAHHHHHHHH")
	open = !open
	if(open):
		$DoorSprite.self_modulate.a = 0.0
		$CollisionArea.set_deferred("disabled", true)
	else:
		$DoorSprite.self_modulate.a = 1.0
		$CollisionArea.set_deferred("disabled", false)
		
