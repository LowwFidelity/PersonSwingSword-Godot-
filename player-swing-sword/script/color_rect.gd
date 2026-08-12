extends ColorRect

var tween :Tween

func modify_bounds(is_open : bool) -> void:
	if tween && tween.is_running():
		tween.kill()
		
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	
	if is_open:
		tween.tween_property(self, "size", Vector2(500,500), 1.0)
	elif !is_open:
		tween.tween_property(self, "size", Vector2(0,500), 1.0)
		tween.tween_callback(func(): visible = false)
