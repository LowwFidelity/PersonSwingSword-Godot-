class_name Player extends CharacterBody2D

enum PlayerState { IDLE, RUN, ATTACK }
var current_state : PlayerState = PlayerState.IDLE

@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var animation_component: AnimationComponent = $AnimationComponent
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@export var player_speed: float = 100.0

func _physics_process(delta: float) -> void:
	input_component.update()
	
	if input_component.attack_input and current_state != PlayerState.ATTACK:
		perform_attack()
		return
	
	# Only update movement and idle/run state if not currently attacking
	if current_state != PlayerState.ATTACK:
		movement_component.direction = input_component.move_dir
		movement_component.move(delta, player_speed)
		
		if input_component.move_dir != Vector2.ZERO:
			current_state = PlayerState.RUN
		else:
			current_state = PlayerState.IDLE
			
		animation_component.update_animation(get_state_name(), input_component.move_dir)

func perform_attack() -> void:
	current_state = PlayerState.ATTACK
	
	animation_component.update_animation(get_state_name(), input_component.move_dir)

	await animated_sprite.animation_finished
	
	current_state = PlayerState.IDLE
	
func get_state_name():
	match current_state:
		PlayerState.IDLE:
			return "idle"
		PlayerState.RUN:
			return "run"
		PlayerState.ATTACK:
			return "attack"
		_:
			return "idle"
