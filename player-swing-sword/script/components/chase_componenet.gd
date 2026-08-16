class_name ChaseComponent extends Node

@onready var parent: CharacterBody2D = get_parent()
var direction: Vector2 = Vector2.ZERO
var target: Player 

func chase():
	direction = (target.global_position - parent.global_position).normalized()


func idle():
	direction = Vector2.ZERO

#Signal receiver function to get Player body to use it's position
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		target = body
