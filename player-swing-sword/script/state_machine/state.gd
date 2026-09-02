class_name State extends Node

#this parent variable is used for the use of all the onready variables of the 
#parent node (for example Player)
var parent: Node

func enter_state() -> void:
	pass

func exit_state() -> void:
	pass

func on_process(_delta: float) -> void:
	pass

func on_physics_process(_delta: float) -> void:
	pass
