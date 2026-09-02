extends State

var direction: Vector2

func enter_state() -> void:
	parent.velocity = Vector2.ZERO
	direction = parent.input_component.move_dir

func on_physics_process(_delta: float) -> void:
	parent.weapon.weapon_swing.update_animation()
	parent.animation_component.update_animation(self.name.to_lower(),parent.weapon.mouse_pos)
	await parent.weapon.weapon_swing.animation_finished
	get_parent().transition_to("idle")
