class_name DetectionComponent extends Area2D

signal body_detected(body: Node)
signal body_lost

var detected : bool = false

func _on_body_entered(body: Node) -> void:
	if body is protag:
		body_detected.emit(body)


func _on_body_exited(body: Node) -> void:
	if body is protag:
		body_lost.emit()
