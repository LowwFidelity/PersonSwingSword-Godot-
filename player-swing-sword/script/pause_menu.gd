class_name PauseMenu extends Control


func _ready() -> void:
	visible = false
	

func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false
	

func _on_quit_pressed() -> void:
	get_tree().quit()
