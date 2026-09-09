extends State

var direction: Vector2

func enter_state() -> void:
	pass
	
func on_physics_process(_delta: float) -> void:
	parent.input_component.update()
	direction = parent.input_component.move_dir
	parent.movement_component.move(direction)
	parent.animation_component.update_animation(self.name.to_lower(),direction)
	
	if direction == Vector2.ZERO:
		get_parent().transition_to("idle")
	if Input.is_action_just_pressed("attack"):
		get_parent().transition_to("attack")
