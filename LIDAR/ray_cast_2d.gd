extends RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var screen_coord = get_viewport().get_screen_transform() * get_global_transform_with_canvas() * position
			#(get_viewport().get_visible_rect().position - global_position)
			var dir : Vector2 = event.position - screen_coord
			rotation = rad_to_deg(dir.angle())
			#rotation = position.angle_to_point(event.position) * 2 * PI
			print("ray position: ", screen_coord)
			print("Mouse Motion at: ", event.position)
			print("ray rotation: ", rotation)
