class_name MovementComponent extends Node

@export var body : CharacterBody2D 
@export var sprite : Node2D
@export var speed : float = 100.0

var direction : Vector2 = Vector2.ZERO

func tick(_delta : float) -> void:
	if body == null:
		return
	
	#MOVEMENT
	body.velocity.x = direction.x * speed
	body.velocity.y = direction.y * speed
	
	body.move_and_slide()
