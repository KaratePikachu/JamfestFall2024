class_name TransitionScene extends Area2D
@export var scene_name: PackedScene

func _on_body_entered(body: Node2D):
	print("YOU HAVE ENTEREDTHE AREA!")
	if(body is Player):
		get_tree().change_scene_to_packed(scene_name)
