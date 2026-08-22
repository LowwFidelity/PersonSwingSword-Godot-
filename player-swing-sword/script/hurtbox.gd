class_name Hurtbox extends Area2D

func _init() -> void:
	collision_layer = 0 
	collision_mask = 2

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(hitbox: Hitbox) -> void:
		if hitbox == null:
			owner.health_component.state
			return
		if owner and "health_component" in owner:
			owner.health_component.damage(hitbox.damage)
