extends State

var direction

func enter_state() -> void:
	parent.input_component.move_dir = Vector2.ZERO
	direction = parent.input_component.move_dir

func on_physics_process(_delta: float) -> void:
	parent.animation_component.update_animation(self.name.to_lower(),direction)
	await parent.animated_sprite_2d.animation_finished
	get_parent().transition_to("idle")
	
func exit_state() -> void:
	pass
