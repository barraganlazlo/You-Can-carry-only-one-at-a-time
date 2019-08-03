extends Area2D

func _ready():
	pass


func _on_Item_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		print("y")