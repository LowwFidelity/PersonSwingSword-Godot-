class_name protag extends CharacterBody2D

@export var stats: PlayerStats

@onready var state_machine: StateMachine = $StateMachine
@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var animation_component: AnimationComponent = $AnimationComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_component: HealthComponent = $HealthComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var weapon: Weapon = $Weapon
@onready var dash_timer: Timer = $DashTimer

func _on_player_died() -> void:
	owner.on_game_over()
