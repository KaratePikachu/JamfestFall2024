class_name GlassesPickup extends Interactable


func interact():
	Player.instance.grant_glasses(glasses_type())
	queue_free()
	
	
func glasses_type() -> Player.Glasses:
	printerr("Do not use the generic glasses. Did you mean to use normal glasses?")
	return -1
