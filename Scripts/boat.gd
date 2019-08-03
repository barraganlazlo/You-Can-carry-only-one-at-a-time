extends Node2D

onready var TweenNode=get_node("Tween")
export(int) var timeToTravel
export(int) var Xposition1
export(int) var Xposition2

var position1=true
var moving=false;
func _ready():
	position.x=Xposition1;
func switch_position():
	if(moving):
		return
	moving=true;
	var pos
	if(position1):
		pos=Xposition2
	else:
		pos=Xposition1
	position1=!position1
	TweenNode.interpolate_property(self,"position:x",position.x,pos,timeToTravel,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	TweenNode.start()

func _on_River_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		switch_position()


func _on_Tween_tween_completed(object, key):
	moving=false
	print("y")
