class_name Enemy extends CharacterBody2D

@onready var detection_component: DetectionComponent = $DetectionComponent
@onready var chase_component: ChaseComponent = $ChaseComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var animation_component: AnimationComponent = $AnimationComponent
@onready var health_component : HealthComponent = $HealthComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var state_machine: StateMachine = $StateMachine

func _on_enemy_died() -> void:
		owner.on_game_win()
		queue_free()
