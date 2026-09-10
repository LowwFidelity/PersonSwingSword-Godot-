class_name Game extends Node2D

@onready var inventory: Inventory = $CanvasLayer/Inventory
@onready var pause_menu: PauseMenu = $CanvasLayer/PauseMenu
@onready var game_over: Control = $CanvasLayer/GameOver
@onready var win_screen: WinScreen = $CanvasLayer/WinScreen

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused

func on_game_over() -> void:
	get_tree().paused = true
	game_over.visible = true

func on_game_win() -> void:
	get_tree().paused = true
	win_screen.visible = true
