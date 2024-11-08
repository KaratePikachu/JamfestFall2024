class_name Interactable extends Area2D

func _process(_delta: float) -> void:
	# NOTE: might be better to handle input in the player instead?
	if Input.is_action_just_pressed("interact") and Player.instance in get_overlapping_bodies():
		interact()
		
func interact():
	printerr("Interactable: error, used generic pickup instead of specific pickup")
	pass
