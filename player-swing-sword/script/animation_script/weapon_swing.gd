class_name WeaponSwing extends AnimationPlayer

@export var sprite : Weapon

func update_animation() -> void:
	play("attack")
