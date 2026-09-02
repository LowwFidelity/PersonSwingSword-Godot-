class_name Weapon extends Node2D

@onready var weapon_swing : WeaponSwing = $WeaponSwing

var finished : bool = false
var mouse_pos: Vector2
func _process(_delta: float) -> void:
	mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

func animation_finished() -> void:
	if weapon_swing.animation_finished:
		return
