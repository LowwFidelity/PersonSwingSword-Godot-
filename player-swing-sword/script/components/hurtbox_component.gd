class_name HurtboxComponent extends Area2D

func _on_area_entered(area: HitboxComponent) -> void:
	if HitboxComponent == null:
		return
	
	if area is HitboxComponent:
		owner.health_component.damage(area.damage)
