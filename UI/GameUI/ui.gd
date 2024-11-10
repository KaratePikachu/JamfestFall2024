extends Control


func _ready() -> void:
	Player.instance.glasses_changed.connect(_on_glasses_change)
		
func _on_glasses_change(old_glasses: int, new_glasses: int) -> void:
	for n in $Hotbar/CenterContainer.get_children():
		n.get_parent().remove_child(n)
		$Hotbar.add_child(n)
		n.visible = false
	
	for g in Player.instance.obtained_glasses:
		var n = $Hotbar.get_node(str(g))
		if g == new_glasses:
			n.modulate.a = 1
		else:
			n.modulate.a = 0.5
		n.get_parent().remove_child(n)
		$"Hotbar/CenterContainer".add_child(n)
		n.visible = true
