extends Area2D

var follow=false
var slot_over=[]
var current_slot
var start_slot
export(ItemManager.ItemType) var type

func _ready():
	var res = load(str("res://Sprites/Items/",ItemManager.ItemType.keys()[type] ,".png"))
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
			ItemManager.follow=true
			print(str("side : ",current_slot.is_right_side()))
		else:
			if(slot_over and slot_over[slot_over.size()-1]):
				put_in_slot(slot_over[slot_over.size()-1])
			follow=false
			ItemManager.follow=false
			position= Vector2.ZERO

func _area_entered(area):
	if("Slot" in area.name and area.is_right_side()==ItemManager.rightside):
		print("entered : " + area.name)
		slot_over.append(area)

func _area_exited(area ):
	if("Slot" in area.name and area.is_right_side()==ItemManager.rightside):
		print("exited : " + area.name)
		slot_over.erase(area)

func put_in_slot(slot):
	current_slot.on_remove(self,slot)
	if(slot.full):
		slot.on_remove(slot.item,current_slot)
		current_slot.on_add(slot.item)
		slot.item.current_slot=current_slot
	current_slot=slot
	slot.on_add(self)
	if(ItemManager.boat.LeftSlots.check_win()):
		LevelManager.win()

func _mouse_entered():
	if(!ItemManager.follow):
		scale=Vector2(1.2,1.2)

func _mouse_exited():
	scale=Vector2(0.9,0.9)