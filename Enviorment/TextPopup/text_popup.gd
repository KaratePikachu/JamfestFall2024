extends Area2D

@export var text : String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = text
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var tween = get_tree().create_tween()
		tween.tween_property($Label, "visible_characters", text.length(), 1.5)


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		$Label.visible_characters = 0
