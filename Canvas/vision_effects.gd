extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player.instance.glasses_changed.connect(_on_glasses_change)
	
func _on_glasses_change(old_glasses : Player.Glasses, new_glasses : Player.Glasses) -> void:
	disable_vision()
	enable_vision(new_glasses)
	
func disable_vision():
	$Blindness.visible = false
	$Sunglasses.visible = false
	$Drone.visible = false
	$Drone.visible = false
	$Drone/DroneEffectOne.visible = false
	$Drone/DroneEffectTwo.visible = false
	$Drone/DroneEffectThree.visible = false
	
	$NormalBackdrop.visible = false
	$SunglassesBackdrop.visible = false
	$InfraredBackdrop.visible = false
	
func enable_vision(glasses : Player.Glasses):
	if(glasses == Player.Glasses.NONE):
		$Blindness.visible = true
	elif(glasses == Player.Glasses.SUNGLASSES):
		$Sunglasses.visible = true
	elif(glasses == Player.Glasses.DRONE):
		$Drone.visible = true
		$Drone/DroneEffectOne.visible = true
		$Drone/DroneEffectTwo.visible = true
		$Drone/DroneEffectThree.visible = true
		
	if(glasses == Player.Glasses.NONE or glasses == Player.Glasses.NORMAL or glasses == Player.Glasses.DRONE):
		$NormalBackdrop.visible = true
	elif(glasses == Player.Glasses.SUNGLASSES):
		$SunglassesBackdrop.visible = true
	elif(glasses == Player.Glasses.INFARED):
		$InfraredBackdrop.visible = true
	pass
	
