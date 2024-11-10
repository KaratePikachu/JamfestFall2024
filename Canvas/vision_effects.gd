extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Player.instance.bind_glasses_changed(self,"change_vision_effect")
	#Player.instance.connect("glasses_changed", Callable(self, "change_vision_effect"))
	Player.instance.glasses_changed.connect(_on_glasses_change)
	
func _on_glasses_change(old_glasses : Player.Glasses, new_glasses : Player.Glasses) -> void:
	disable_vision()
	enable_vision(new_glasses)
	
func disable_vision():
	$Blindness.visible = false
	$Sunglasses.visible = false
	$Drone.visible = false
	$Drone.visible = false
	
func enable_vision(glasses : Player.Glasses):
	if(glasses == Player.Glasses.NONE):
		$Blindness.visible = true
	elif(glasses == Player.Glasses.SUNGLASSES):
		$Sunglasses.visible = true
	elif(glasses == Player.Glasses.DRONE):
		$Drone.visible = true
	pass
	
