extends "res://Level/timer.gd"


func _process(delta: float) -> void:
	$TimerText.text = get_time_string()
