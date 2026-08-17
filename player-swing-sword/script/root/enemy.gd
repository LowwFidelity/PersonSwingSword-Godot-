class_name Enemy extends CharacterBody2D

enum EnemyState { IDLE, RUN, ATTACK }
var current_state : EnemyState = EnemyState.IDLE

@onready var detection_component : DetectionComponent = $DetectionComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var chase_component: ChaseComponent = $ChaseComponent
@onready var animation_component: AnimationComponent = $AnimationComponent
@export var enemy_speed: float = 70.0

func _physics_process(delta: float) -> void:
	if detection_component.detected:
		chase_component.chase()
		current_state = EnemyState.RUN
	else:
		chase_component.idle()
		current_state = EnemyState.IDLE
	
	movement_component.direction = chase_component.direction
	movement_component.move(delta, enemy_speed)
	
	animation_component.update_animation(get_state_name(), chase_component.direction)


func _on_area_2d_body_entered(_body: Node2D) -> void:
	detection_component.detected = true
	#print(detection_component.detected)


func _on_area_2d_body_exited(_body: Node2D) -> void:
	detection_component.detected = false
	#print(detection_component.detected)
	
func get_state_name():
	match current_state:
		EnemyState.IDLE:
			return "idle"
		EnemyState.RUN:
			return "run"
		EnemyState.ATTACK:
			return "attack"
		_:
			return "idle"

func _on_died():
		queue_free()
