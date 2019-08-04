extends Node2D

export(bool) var rightside=true
var slots
var items= []
var to_delete=[]
var to_combine=[]
var to_protect=[]

func _ready():
	slots=get_children()
	for type in ItemManager.ItemType :
		items.append(0)

func check():
	count_items()
	print(items)
	if(items[ItemManager.ItemType.Sheep]>0 and items[ItemManager.ItemType.Laitue]>0):
		print("y")
		for i in range(min(items[ItemManager.ItemType.Sheep],items[ItemManager.ItemType.Laitue])):
			print(i)
			delete(ItemManager.ItemType.Laitue)
	if(items[ItemManager.ItemType.Wolf] - items[ItemManager.ItemType.Dog]>0 and items[ItemManager.ItemType.Sheep]>0):
		for i in range(min(items[ItemManager.ItemType.Wolf],items[ItemManager.ItemType.Sheep])):
			delete(ItemManager.ItemType.Sheep)
	delete_to_delete()


func delete(type):
	for slot in slots:
		if(slot.itemType==type):
			to_delete.append(slot)
			return true
	return false

func delete_to_delete():
	for slot in to_delete:
		if(slot!=null):
			slot.delete_item()

func count_items():
	for i in range(items.size()):
		items[i]=0
	for slot in slots:
		if(slot.itemType==-1):
			continue
		else:
			items[slot.itemType]+=1