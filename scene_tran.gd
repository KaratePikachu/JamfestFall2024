extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("flopp")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@export var scene_name: PackedScene
func _on_animation_player_animation_finished(name: String) -> void:
	get_tree().change_scene_to_packed(scene_name)
