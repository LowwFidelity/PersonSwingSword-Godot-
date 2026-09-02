class_name WeaponSwing extends AnimationPlayer

@export var sprite : Weapon

func play_animation() -> void:
	play("attack")
