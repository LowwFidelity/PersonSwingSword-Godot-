class_name Player extends CharacterBody2D

enum PlayerState { IDLE, RUN, ATTACK, HURT, HEAL }
var current_state : PlayerState = PlayerState.IDLE

@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var animation_component: AnimationComponent = $AnimationComponent
@onready var health_component : HealthComponent = $HealthComponent
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var health_change : HealthChange = $HealthChange
@onready var weapon: Weapon = $Weapon

@export var player_speed: float = 100.0
@export var speed_boost: float = player_speed * 1.2
var direction: Vector2

func _ready() -> void:
	health_component.died.connect(_on_player_died)
	health_component.health_changed.connect(_on_health_changed)
	

func _physics_process(delta: float) -> void:
	input_component.update()
	
	if input_component.attack_input and current_state != PlayerState.ATTACK and current_state != PlayerState.HURT:
		perform_attack()
		return
	
	# Only update movement and idle/run state if not currently attacking
	if current_state != PlayerState.ATTACK and current_state != PlayerState.HURT:
		direction = input_component.move_dir
		movement_component.move(direction)
		if input_component.sprint:
			direction = input_component.move_dir
			movement_component.move(direction)
		
		if input_component.move_dir != Vector2.ZERO:
			current_state = PlayerState.RUN
		else:
			current_state = PlayerState.IDLE
			
		animation_component.update_animation(get_state_name(), input_component.move_dir)
		weapon.weapon_swing.last_dir = weapon.weapon_swing.get_string_direction(input_component.move_dir)
		

func _on_health_changed() -> void:
		if health_component.state == "hurt":
			current_state = PlayerState.HURT
			health_change.update_animation(get_state_name(), input_component.move_dir)
		elif health_component.state == "heal":
			current_state = PlayerState.HEAL
			health_change.update_animation(get_state_name(), input_component.move_dir)
			

func perform_attack() -> void:
	current_state = PlayerState.ATTACK
	
	animation_component.update_animation(get_state_name(), input_component.move_dir)
	weapon.weapon_swing.update_animation()
	
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
		PlayerState.HEAL:
			return "heal"
		PlayerState.HURT:
			return "hurt"
		_:
			return "idle"
func _on_player_died() -> void:
	print("Player Died!")
