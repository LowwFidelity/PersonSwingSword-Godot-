extends State

@export var enemies:= 0
@onready var wave_timer: Timer = $WaveTimer
@onready var ENEMY: PackedScene = preload("res://scene/enemy.tscn")
var target = protag

func enter_state() -> void:
	wave_timer.start(1.0)
	get_tree().call_group("giant_spiders", "spawner_summon", target)

func _on_wave_timer_timeout() -> void:
	var wave = randi_range(1,3)
	if enemies - wave <= 0:
		wave_timer.stop()
		_on_body_lost()
		return
	for spawns in wave:
		var enemy_instance = ENEMY.instantiate()
		enemy_instance.position = Vector2(randi_range(-100,100), randi_range(-100,100))
		add_child(enemy_instance)
		get_tree().call_group("giant_spiders", "spawner_summon", target)
	enemies -= wave
		

func _on_body_lost() -> void:
	get_parent().transition_to("dormant")
