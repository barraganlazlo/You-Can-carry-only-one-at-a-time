extends Area2D

var full=false
var slotManager
var itemType=-1
var item
func _ready():
	slotManager=get_parent()

func on_remove(item,slot):
	itemType=-1
	full=false
	reparent(item,slot)

func on_add(item):
	self.item=item
	itemType=item.type
	full =true
	
func is_right_side():
	return ItemManager.rightside #allow to allways put into the player slot

func reparent(source, target):
	call_deferred("helper", source, target)

func helper(source,target):
	remove_child(source)
	target.add_child(source)

func delete_item():
	itemType=-1
	full=false
	remove_child(item)
	item=null