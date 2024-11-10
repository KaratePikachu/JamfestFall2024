extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player.instance.glasses_changed.connect(_on_glasses_change)
	
func _on_glasses_change(old_glasses : Player.Glasses, new_glasses : Player.Glasses) -> void:
	print("yoda")
	disable_vision()
	enable_vision(new_glasses)
	
func disable_vision():
	$Blindness/BlurOne/blur.visible = false
	$Blindness/BlurTwo/newBlur.visible = false
	$Sunglasses/Tint_layer/Tint.visible = false
	$Sunglasses/BlurOne/Blur.visible = false
	$Sunglasses/BlurTwo/newBlur.visible = false
	$Drone.visible = false
	$Drone.visible = false
	$Drone/DroneEffectOne.visible = false
	$Drone/DroneEffectTwo.visible = false
	$Drone/DroneEffectThree.visible = false
	
func enable_vision(glasses : Player.Glasses):
	if(glasses == Player.Glasses.NONE):
		$Blindness/BlurOne/blur.visible = true
		$Blindness/BlurTwo/newBlur.visible = true
	elif(glasses == Player.Glasses.SUNGLASSES):
		$Sunglasses/Tint_layer/Tint.visible = true
		$Sunglasses/BlurOne/Blur.visible = true
		$Sunglasses/BlurTwo/newBlur.visible = true
	elif(glasses == Player.Glasses.DRONE):
		$Drone.visible = true
		$Drone/DroneEffectOne.visible = true
		$Drone/DroneEffectTwo.visible = true
		$Drone/DroneEffectThree.visible = true
	pass
	
