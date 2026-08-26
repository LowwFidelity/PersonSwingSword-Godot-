class_name HealthComponent extends Node

signal health_changed
signal died

@export var max_health := 100.0
@export var current_health := 0.0
var previous_health := 0.0
var state := "fine"

func _ready() -> void:	
	previous_health = current_health
	current_health = max_health
	_emit()

func damage(amount: float) -> void:
	current_health = clamp(current_health - amount, 0.0, max_health)
	state = "hurt"
	_emit()
	if current_health == 0.0:
		died.emit()

func heal(amount: float) -> void:
	current_health = clamp(current_health + amount, 0.0, max_health)
	state = "heal"
	_emit()
	
func _emit() -> void:
	health_changed.emit()
