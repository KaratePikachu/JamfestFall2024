extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert($NormalTiles != null, "The TileMapLayers node requires a child TileMapLayer named 'NormalTiles'")
	assert($DarkTiles != null, "The TileMapLayers node requires a child TileMapLayer named 'DarkTiles'")
	#Player.instance.bind_glasses_changed(self,"change_vision_effect")
	#Player.instance.connect("glasses_changed", Callable(self, "change_vision_effect"))
	Player.instance.glasses_changed.connect(_on_glasses_change)
	
func _on_glasses_change(old_glasses : Player.Glasses, new_glasses : Player.Glasses) -> void:
	disable_vision()
	enable_vision(new_glasses)
	
func disable_vision():
	$NormalTiles.visible = false
	$DarkTiles.visible = false
	
func enable_vision(glasses : Player.Glasses):
	#Normal Tiles
	if(not (glasses == Player.Glasses.INFARED)):
		$NormalTiles.visible = true
	
	#Dark Tiles
	if(not (glasses == Player.Glasses.INFARED || glasses == Player.Glasses.SUNGLASSES)):
		$DarkTiles.visible = true
	
