extends Area2D

var follow=false
var slot_over
var current_slot
var start_slot
export(ItemManager.ItemType) var type

func _ready():
	var res = load("res://Sprites/items/"+ ItemManager.ItemType.keys()[type] +".png")
	get_node("Sprite").set_texture(res)
	start_slot=get_parent()
	current_slot=start_slot
	current_slot.on_add(self)

func _process(delta):
	if (follow):
		global_position=get_global_mouse_position()

func _input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton):
		if(event.pressed and current_slot.is_right_side()==ItemManager.rightside):
			follow=true
			print("side : " )
			print(current_slot.is_right_side())
		else:
			if(slot_over):
				print(slot_over.name)
				put_in_slot(slot_over)
			follow=false
			position= Vector2.ZERO

func _area_entered(area):
	if("Slot" in area.name and area.is_right_side()==ItemManager.rightside && !area.full):
		print("entered : " + area.name)
		slot_over=area

func _area_exited(area ):
	if("Slot" in area.name and area.is_right_side()==ItemManager.rightside && !area.full):
		print("exited : " + area.name)
		if(slot_over==area):
			slot_over=null

func put_in_slot(slot):
	current_slot.on_remove(self,slot)
	current_slot=slot
	slot.on_add(self)

