extends StaticBody2D



func _ready() -> void:
	Player.instance.glasses_changed.connect(_on_glasses_change)
	
func _on_glasses_change(old_glasses: int, new_glasses: int) -> void:
	if(new_glasses == Player.Glasses.SUNGLASSES):
		print("hide")
		$Sprite2D.visible = false
	else: 
		print("show")
		$Sprite2D.visible = true
