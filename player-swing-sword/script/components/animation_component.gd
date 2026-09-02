class_name AnimationComponent extends Node

@export var sprite : AnimatedSprite2D
var last_dir : String = "down"

func update_animation(state : String, dir : Vector2):
	var direction : String = get_string_direction(dir)
	var animation : String = state + "_" + direction
	
	if sprite and sprite.sprite_frames.has_animation(animation):
		sprite.play(animation)

func get_string_direction(dir : Vector2) -> String:
	if dir == Vector2.ZERO:
		return last_dir

	if abs(dir.x) > abs(dir.y):
		if dir.x > 0:
			last_dir = "right"
		else:
			last_dir = "left"
	else:
		if dir.y > 0:
			last_dir = "down"
		else:
			last_dir = "up"
			
	return last_dir
