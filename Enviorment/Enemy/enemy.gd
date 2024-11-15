extends CharacterBody2D

@export var speed : int = 1000
@export var jumpHeight : int = 30000

@export var canSpin : bool = false
@export var timePaused : int = 3
var isSpinning : bool = true
var timer : float = 0.0

var dont_fucking_ask : float = 0.0

func _ready() -> void:
	Player.instance.glasses_changed.connect(_on_glasses_change)
	
func _on_glasses_change(old_glasses: int, new_glasses: int) -> void:
	if(new_glasses == Player.Glasses.DRONE or new_glasses == Player.Glasses.NORMAL):
		$DetectionCone.visible = true
	else: 
		$DetectionCone.visible = false
	
	if(new_glasses == Player.Glasses.NORMAL or new_glasses == Player.Glasses.DRONE):
		$Sprite.visible = true
		$AnimationPlayer.play("idle")
	elif new_glasses == Player.Glasses.INFARED:
		$Sprite.visible = true
		$AnimationPlayer.play("idle_ir")
	else: 
		$Sprite.visible = false

func _process(delta: float) -> void:
	if !canSpin:
		return
	if isSpinning:
		$DetectionCone.scale.x = cos(dont_fucking_ask)

		dont_fucking_ask += 0.01 + delta
		if 1 - abs(cos(dont_fucking_ask)) < 0.0001:
			isSpinning = false
			timer = 0.001
			
		if $DetectionCone.scale.x < 0:
			$Sprite.scale.x = 0.189
		else:
			$Sprite.scale.x = -0.189
	else:
		timer += delta
		if timer >= timePaused:
			isSpinning = true
			timer = 0.0 
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.x = velocity.x * 0.95
	velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity")
	move_and_slide()

	
func _on_DetectionCone_body_entered(body: Node2D) -> void:
	print("SOMETHING DETETCTED")
	if body.has_method("grant_glasses"):
		print("BLIND MAN DETETCTED")
		var target := body.position.x
		var direction = 1 if body.global_position.x > global_position.x else -1
		velocity.x = speed * direction
		velocity.y = jumpHeight
		if Player.instance.worn_glasses == Player.Glasses.INFARED:
			$AnimationPlayer.play("pounce_ir")
		else: 
			$AnimationPlayer.play("pounce")
		move_and_slide()


func _on_death_aura_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
