extends State

func enter_state() -> void:
	parent.velocity = Vector2.ZERO

func on_process(_delta: float) -> void:
	if owner and "animation_component" in owner:
		owner.animation_component.update_animation(owner.input_component.move_dir)
