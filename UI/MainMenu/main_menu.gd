extends Control

func _ready() -> void:
	$AnimationPlayer.play("flop")

func _on_exit_pressed() -> void:
	SFX.menu_click.play()
	get_tree().quit()


func _on_play_button_pressed() -> void:
	SFX.menu_click.play()
	get_tree().change_scene_to_file("res://Level/introduction.tscn")
	
