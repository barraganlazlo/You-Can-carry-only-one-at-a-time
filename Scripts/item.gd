extends Area2D

onready var TweenNode=get_node("Tween")
var follow=false
var area_over
var current_area

func _ready():
	current_area=get_parent();

func _process(delta):
	if (follow):
		global_position=get_global_mouse_position()

func _input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton):
		if(event.pressed):
			follow=true
		else:
			if(area_over and !area_over.full):
				current_area=area_over
			follow=false
			global_position=current_area.global_position

func _area_entered(area):
	if("Slot" in area.name):
		area_over=area
func _area_exited(area):
	if("Slot" in area.name):	
		area_over=null