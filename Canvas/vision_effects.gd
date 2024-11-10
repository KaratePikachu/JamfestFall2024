extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player.instance.glasses_changed.connect(_on_glasses_change)
	
func _on_glasses_change(old_glasses : Player.Glasses, new_glasses : Player.Glasses) -> void:
	disable_vision()
	enable_vision(new_glasses)
	
func disable_vision():
	$Blindness/GaussianBlur.visible = false
	$Blindness/DuplicateBlur.visible = false
	
	
	$Sunglasses/Tint.visible = false
	$Sunglasses/DuplicateBlur.visible = false
	$Sunglasses/GaussianBlur.visible = false
	
	
	$Drone/Desaturation.visible = false
	$Drone/VCR.visible = false
	
	$NormalBackdrop.visible = false
	$SunglassesBackdrop.visible = false
	$InfraredBackdrop.visible = false
	
func enable_vision(glasses : Player.Glasses):
	if(glasses == Player.Glasses.NONE):
		$Blindness/GaussianBlur.visible = true
		$Blindness/DuplicateBlur.visible = true
	elif(glasses == Player.Glasses.SUNGLASSES):
		$Sunglasses/Tint.visible = true
		$Sunglasses/DuplicateBlur.visible = true
		$Sunglasses/GaussianBlur.visible = true
	elif(glasses == Player.Glasses.DRONE):
		$Drone/Desaturation.visible = true
		$Drone/VCR.visible = true
		
	if(glasses == Player.Glasses.NONE or glasses == Player.Glasses.NORMAL or glasses == Player.Glasses.DRONE):
		$NormalBackdrop.visible = true
	elif(glasses == Player.Glasses.SUNGLASSES):
		$SunglassesBackdrop.visible = true
	elif(glasses == Player.Glasses.INFARED):
		$InfraredBackdrop.visible = true
	pass
	
