extends Area2D

@export var forced : Player.Glasses = Player.Glasses.NONE


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Player.instance.worn_glasses = forced


func _on_body_exited(body: Node2D) -> void:
	pass
