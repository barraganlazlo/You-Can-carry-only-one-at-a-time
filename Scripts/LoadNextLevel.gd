extends Button

func _pressed():
	LevelManager.load_next_level()

const DURATION = 0.2

var _scale_tween = null


func _ready():
	self.connect("mouse_entered", self, "_on_mouse_enter")
	self.connect("mouse_exited", self, "_on_mouse_exit")
	_scale_tween = Tween.new()
	add_child(_scale_tween)


func _on_mouse_enter():
	print("en")
	_scale_tween.interpolate_property(self, "rect_scale", 
		Vector2.ONE,Vector2(1.2,1.2), DURATION, Tween.TRANS_QUAD, Tween.EASE_OUT)
	_scale_tween.start()


func _on_mouse_exit():
	print("ex")
	_scale_tween.interpolate_property(self, "rect_scale", 
		Vector2(1.2,1.2), Vector2.ONE, DURATION, Tween.TRANS_QUAD, Tween.EASE_OUT)
	_scale_tween.start()