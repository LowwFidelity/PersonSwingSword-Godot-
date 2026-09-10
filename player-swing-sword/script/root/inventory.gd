class_name Inventory extends Control

@onready var menu : ColorRect = $ColorRect
var is_inventory_open :bool = false

func _input(_event) -> void:
	if Input.is_action_just_pressed("toggle_inventory"):
		is_inventory_open = !is_inventory_open
		if is_inventory_open:
			menu.visible = true
			menu.modify_bounds(true)
		else:
			menu.modify_bounds(false)
