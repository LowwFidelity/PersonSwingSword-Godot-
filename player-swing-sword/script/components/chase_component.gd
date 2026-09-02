class_name ChaseComponent extends Node

@onready var parent: CharacterBody2D = get_parent()
var direction: Vector2 = Vector2.ZERO
var target: protag 
var radius:= 0

func chase() -> Vector2:
	direction = (target.global_position - parent.global_position).normalized()
	return direction

func idle() ->void:
	direction = Vector2.ZERO

#Signal receiver function to get Player body to use it's position
#func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body is protag:
		#target = body
		#radius = body.get_node("CollisionShape2D").shape.radius


func _on_detection_component_body_entered(body: Node2D) -> void:
	if body is protag:
		target = body
		radius = body.get_node("CollisionShape2D").shape.radius
