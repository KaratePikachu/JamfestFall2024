extends Interactable

@export var color : Color = Color(0,0,0)
@export var toggled : bool = false

signal triggered

func _ready():
	pass

func interact():
	if(toggled):
		$Sprites/On.visible = false
		$Sprites/Off.visible = true
		#offNode.visible = true
		#onNode.visible = false
	else:
		$Sprites/On.visible = true
		$Sprites/Off.visible = false
		#offNode.visible = false
		#onNode.visible = true
	toggled = !toggled
	triggered.emit()
	
