class_name MovementComponent extends Node

@export var body : CharacterBody2D
@export var speed : float = 100.0

#var direction : Vector2 = Vector2.ZERO

func move(dir: Vector2) -> void:
	if body == null:
		return
		
	#MOVEMENT
	body.velocity.x = dir.x * speed
	body.velocity.y = dir.y * speed
	
	body.move_and_slide()
