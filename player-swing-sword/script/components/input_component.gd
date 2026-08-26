class_name InputComponent extends Node

var move_dir: Vector2 = Vector2.ZERO
var attack_input: bool = false
var sprint: bool = false 

func update() -> void:
	move_dir = Input.get_vector("left","right","up","down")
	attack_input = Input.is_action_just_pressed("attack")
	sprint = Input.is_action_pressed("sprint")
	#print(move_dir)
	#print(attack_input)
