extends State

var direction: Vector2

func enter_state() -> void:
	pass
#	parent.detection_component.body_detected.connect(_onbody_detected)

func on_physics_process(_delta: float) -> void:
	parent.animation_component.update_animation(self.name.to_lower(),direction)
	parent.chase_component.idle()

func _onbody_detected(_body: Node) -> void:
	get_parent().transition_to("chase")
