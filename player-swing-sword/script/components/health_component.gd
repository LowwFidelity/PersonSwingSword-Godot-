class_name HealthComponent extends Node

signal health_changed(health: int, max_health: int)
signal died


@export var base_max_health: int = 100


var current_max_health: int = 100
var current_health: int = 0: set = on_health_set

func _ready() -> void:
	current_health = current_max_health

func get_max_health() -> int:
	return current_max_health
	
func on_health_set(value: int) -> void:
	#recalculate current stats first
	current_health = clampi(value, 0, current_max_health)
	if current_health <= 0:
		died.emit()
	health_changed.emit(current_health)

func take_damage(amount: float) -> void:
	current_health = clamp(current_health - amount, 0.0, current_max_health)
	if current_health == 0.0:
		died.emit()
	health_changed.emit(current_health)
	print(current_health)
