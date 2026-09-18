extends State

func enter_state() -> void:
	pass

func on_process(_delta: float) -> void:
	pass

func _on_body_detected(body: Node) -> void:
	if body is protag:
		get_parent().transition_to("spawning")
