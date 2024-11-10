extends Interactable


# Called when the node enters the scene tree for the first time.
var simultaneous_scene = preload("res://level/level_3.tscn").instantiate()

func _add_a_scene_manually():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().change_scene_to_file(simultaneous_scene)
