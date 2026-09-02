class_name Game extends Node2D

@onready var inventory: Inventory = $CanvasLayer/Inventory
@onready var pause_menu: PauseMenu = $CanvasLayer/PauseMenu
@onready var game_over: Control = $CanvasLayer/GameOver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_pause()


func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused
