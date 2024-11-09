extends Interactable

@export var color : Color = Color(0,0,0)
@export var status : bool = false

@onready var offNode = get_node("Switch").get_child(0)
@onready var onNode = get_node("Switch").get_child(1)

signal triggered

func _ready():
	$Switch.color = color

func interact():
	if(status):
		offNode.visible = true
		onNode.visible = false
	else:
		offNode.visible = false
		onNode.visible = true
	status = !status
	triggered.emit()
	
