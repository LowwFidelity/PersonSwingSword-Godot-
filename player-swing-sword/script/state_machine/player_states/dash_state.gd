extends State

var direction
var cooldown: Timer

func enter_state() -> void:
	direction = parent.input_component.move_dir
	parent.movement_component.current_speed = parent.movement_component.speed
	
	
func on_physics_process(_delta: float) -> void:
	parent.animation_component.update_animation(self.name.to_lower(),direction)
	parent.movement_component.dash(direction)
	await parent.animated_sprite_2d.animation_finished
	get_parent().transition_to("walk")
