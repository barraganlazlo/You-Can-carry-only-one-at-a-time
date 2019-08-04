extends Area2D

var full=false
var slotManager
var itemType=-1
func _ready():
	slotManager=get_parent()

func on_remove(item,slot):
	itemType=-1
	full=false
	reparent(item,slot)

func on_add(type):
	itemType=type
	full =true
	
func is_right_side():
	return ItemManager.rightside #allow to allways put into the player slot

func reparent(source, target):
    call_deferred("helper", source, target)

func helper(source,target):
    remove_child(source)
    target.add_child(source)
