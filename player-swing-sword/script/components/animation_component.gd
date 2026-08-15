class_name AnimationComponent extends Node

@export var sprite : AnimatedSprite2D
var last_dir : String = "down"

func update_animation(state : String, dir : Vector2):
	var direction : String = get_string_direction(dir)
	var animation : String = state + "_" + direction
	
	if sprite and sprite.sprite_frames.has_animation(animation):
		sprite.play(animation)

#Function turns direction into a string
func get_string_direction(dir : Vector2):
	if dir == Vector2.ZERO:
		return last_dir
	else:
		if abs(dir.x) > abs(dir.y):
			if dir.x > 0:
				last_dir = "right"
				return last_dir
			elif dir.x < 0:
				last_dir = "left"
				return last_dir
		else:
			if dir.y > 0:
				last_dir = "down"
				return last_dir
			elif dir.y < 0:
				last_dir = "up"
				return last_dir
