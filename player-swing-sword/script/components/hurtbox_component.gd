class_name HurtboxComponent extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area is not HitboxComponent:
		return
	owner.health_component.take_damage(area.damage)
