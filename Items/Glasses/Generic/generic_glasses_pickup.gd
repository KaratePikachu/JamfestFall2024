extends Area2D
var player : Player



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = Player.instance
	pass # Replace with function body.


func _process(_delta: float) -> void:
	# NOTE: might be better to handle input in the player instead?
	if Input.is_action_just_pressed("interact") and player in get_overlapping_bodies():
		player.put_on_glasses(Player.Glasses.SUNGLASSES)
		
func get_glasses_type():
	return null
