class_name Enemy extends CharacterBody2D

@onready var detection_component : DetectionComponent = $DetectionComponent

func _physics_process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	detection_component.detected = true
	#print(detection_component.detected)


func _on_area_2d_body_exited(body: Node2D) -> void:
	detection_component.detected = false
	#print(detection_component.detected)
