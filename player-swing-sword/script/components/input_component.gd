class_name InputComponent extends Node

var move_dir: Vector2 = Vector2.ZERO
var attack_input: bool = false
var hurt_pressed
var heal_pressed

func update() -> void:
	move_dir = Input.get_vector("left","right","up","down")
	attack_input = Input.is_action_just_pressed("attack")
	hurt_pressed = Input.is_action_just_pressed("hurt")
	heal_pressed = Input.is_action_just_pressed("heal")
		
	
