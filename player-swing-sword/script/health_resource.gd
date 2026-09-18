extends Resource
class_name HealthResource

signal died
signal health_changed
var current_max_health

func get_max_health() -> int:
	return current_max_health
	
func on_health_set(value: int, current_health: int) -> void:
	#recalculate current stats first
	current_health = clampi(value, 0, current_max_health)
	if current_health <= 0:
		died.emit()
	health_changed.emit(current_health)

func take_damage(amount: float, current_health: int) -> void:
	current_health = clamp(current_health - amount, 0.0, current_max_health)
	if current_health == 0.0:
		died.emit()
	health_changed.emit(current_health)
	print(current_health)
