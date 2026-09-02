extends State

func enter_state() -> void:
	pass
	#parent.detection_component.body_lost.connect(_on_body_lost)

func on_physics_process(_delta: float) -> void:
	var direction = parent.chase_component.chase()
	parent.movement_component.move(direction)
	parent.animation_component.update_animation(self.name.to_lower(),direction)

func _on_body_lost() -> void:
	get_parent().transition_to("patrol")
