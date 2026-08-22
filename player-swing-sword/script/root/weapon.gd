class_name Weapon extends Node2D

@onready var weapon_swing : WeaponSwing = $WeaponSwing

var finished : bool = false

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

func animation_finished() -> void:
	if weapon_swing.animation_finished:
		return
