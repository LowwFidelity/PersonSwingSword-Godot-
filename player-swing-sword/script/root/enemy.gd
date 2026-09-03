class_name Enemy extends CharacterBody2D



@onready var detection_component: DetectionComponent = $DetectionComponent
@onready var chase_component: ChaseComponent = $ChaseComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var animation_component: AnimationComponent = $AnimationComponent
@onready var health_component : HealthComponent = $HealthComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var state_machine: StateMachine = $StateMachine

#@export var enemy_speed: float = 70.0
#var direction: Vector2
#
#func _ready() -> void:
	#health_component.died.connect(_on_enemy_died)
	#health_component.health_changed.connect(_on_health_changed)
#
#func _physics_process(_delta: float) -> void:
	#if current_state != EnemyState.ATTACK:
		#direction = chase_component.direction
		#movement_component.move(direction)
#
		#if detection_component.detected:
			#chase_component.chase()
		#else:
			#chase_component.idle()
#
	#direction = chase_component.direction
	#animation_component.update_animation(get_state_name(), chase_component.direction)
#
#func _on_health_changed() -> void:
		#health_change.update_animation(get_state_name(), chase_component.direction)

#func _on_area_2d_body_entered(_body: protag) -> void:
	#if protag == null:
		#return
	#else:
		#detection_component.detected = true
	##print(detection_component.detected)
#
#
#func _on_area_2d_body_exited(_body: protag) -> void:
		#if protag == null:
			#return
		#else:
			#detection_component.detected = false
	##print(detection_component.detected)
	#
#func get_state_name():
	#match current_state:
		#EnemyState.IDLE:
			#return "idle"
		#EnemyState.RUN:
			#return "run"
		#EnemyState.ATTACK:
			#return "attack"
		#EnemyState.HEAL:
			#return "heal"
		#EnemyState.HURT:
			#return "hurt"
		#_:
			#return "idle"

func _on_enemy_died() -> void:
		queue_free()
