extends State

@export var enemies := 0
@onready var wave_timer: Timer = $WaveTimer

func enter_state() -> void:
	wave_timer.start(10.0)

func on_process(_delta: float) -> void:
	get_tree().call_group("giant_spiders", transition_to("chase"))
	await wave_timer.timeout
	

func _on_body_lost() -> void:
	if
		get_parent().transition_to("dormant")
	
