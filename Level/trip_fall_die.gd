extends Node2D

func _on_top_body_entered(body: Node2D) -> void:
	if body is Player:
		#var tween = get_tree().create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
		#tween.tween_property($"../Player", "position", Vector2(3200,100), 0.3)
		#tween.tween_property($"../Player", "velocity", Vector2(3200000,-100), 0.1)
		##body.velocity.x = 40000
		body.velocity = Vector2(1000, -1000)
		body.in_anim = true


func _on_glasses_change_2_body_entered(body: Node2D) -> void:
	var index = 0
	for g in Player.obtained_glasses:
		if g == Player.Glasses.NORMAL:
			Player.obtained_glasses.remove_at(index)
			Player.instance.in_anim = false
			return
		index+=1
