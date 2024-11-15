extends Area2D

@export var text : String = ""
@export var color : Color = Color(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = text
	$Label.set("theme_override_colors/font_color",color)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var tween = get_tree().create_tween()
		tween.tween_property($Label, "visible_characters", text.length(), 1.5)
		print("DISPLASY")


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		$Label.visible_characters = 0
