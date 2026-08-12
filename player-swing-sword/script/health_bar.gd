class_name HealthBar extends ProgressBar

@onready var health_component : HealthComponent

func display():
	health_component.get_health()
