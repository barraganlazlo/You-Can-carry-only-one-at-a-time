extends Node2D

onready var TweenNode=get_node("Tween")
onready var RightSlots=get_node("../RightSlots")
onready var LeftSlots=get_node("../LeftSlots")
export(int) var timeToTravel
export(int) var Xposition1
export(int) var Xposition2

var moving=false;
func _ready():
	position.x=Xposition1
	ItemManager.rightside=true
func switch_position():
	if(moving):
		return
	moving=true;
	var pos
	if(ItemManager.rightside):
		pos=Xposition2
		RightSlots.check()
	else:
		pos=Xposition1
		LeftSlots.check()
	TweenNode.interpolate_property(self,"position:x",position.x,pos,timeToTravel,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	TweenNode.start()
	ItemManager.rightside=!ItemManager.rightside

func _on_River_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		switch_position()


func _on_Tween_tween_completed(object, key):
	moving=false
