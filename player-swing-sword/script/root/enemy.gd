class_name Enemy extends CharacterBody2D

enum EnemyState { IDLE, RUN, ATTACK, HURT, HEAL }
var current_state : EnemyState = EnemyState.IDLE

@onready var detection_component : DetectionComponent = $DetectionComponent
@onready var chase_component: ChaseComponent = $ChaseComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var animation_component: AnimationComponent = $AnimationComponent
@onready var health_component : HealthComponent = $HealthComponent
@onready var hurtbox: Hurtbox = $AnimatedSprite2D/HurtBox
@onready var health_change: HealthChange = $HealthChange

@export var enemy_speed: float = 70.0

func _ready() -> void:
	health_component.died.connect(_on_enemy_died)
	health_component.health_changed.connect(_on_health_changed)

func _physics_process(delta: float) -> void:
	if current_state != EnemyState.ATTACK:
		movement_component.direction = chase_component.direction
		movement_component.move(delta, enemy_speed)
		
		if detection_component.detected and current_state != EnemyState.HURT:
			chase_component.chase()
			current_state = EnemyState.RUN
		else:
			chase_component.idle()
			current_state = EnemyState.IDLE
			
		
	
	movement_component.direction = chase_component.direction
	
	animation_component.update_animation(get_state_name(), chase_component.direction)

func _on_health_changed() -> void:
		if health_component.state == "hurt":
			current_state = EnemyState.HURT
			health_change.update_animation(get_state_name(), chase_component.direction)
		elif health_component.state == "heal":
			current_state = EnemyState.HEAL
			health_change.update_animation(get_state_name(), chase_component.direction)

			

func _on_area_2d_body_entered(_body: Player) -> void:
	if Player == null:
		return
	else:
		detection_component.detected = true
	#print(detection_component.detected)


func _on_area_2d_body_exited(_body: Player) -> void:
		if Player == null:
			return
		else:
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
		EnemyState.HEAL:
			return "heal"
		EnemyState.HURT:
			return "hurt"
		_:
			return "idle"

func _on_enemy_died() -> void:
		queue_free()
