extends Control

func _ready() -> void:
	$AnimationPlayer.play("flop")
	$AnimationPlayer.queue("run")

func _on_exit_pressed() -> void:
	SFX.menu_click.play()
	get_tree().quit()


func _on_play_button_pressed() -> void:
	SFX.menu_click.play()
	SpeedrunTimer.time_elapsed = 0
	get_tree().change_scene_to_file("res://Level/introduction.tscn")
	
