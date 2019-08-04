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

func check2():
	to_delete.clear()
	to_combine.clear()
	to_protect.clear()
	count_items()
	print(items)
	for type in ItemManager.ItemType.values() :
		if(contains(type) and ItemManager.Items[type].kill!=null):
			print(str(type , "kill" , ItemManager.Items[type].kill))
			for t in ItemManager.Items[type].kill :
				delete(t)
			for t in ItemManager.Items[type].protect :
				protect(t)
			#for t in ItemManager.Items[type].combine :
			#	combine(type,t)
		protect_to_protect()
		delete_to_delete()

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

func contains(type):
	return items[type]>0

func delete(type):
	for slot in slots:
		if(slot.itemType==type):
			to_delete.append(slot)
			return true
	return false

func protect(type):
	to_protect.append(type)

func combine(type1,type2):
	var got1=false
	var got2=false
	var slot1
	var slot2
	for slot in slots :
		if(!got1 and slot.itemType==type1):
			slot1=slot
		if(!got2 and slot.itemType==type1):
			slot1=slot
	if(got1 and got2):
		return true
	return false

func delete_to_delete():
	for slot in to_delete:
		if(slot!=null):
			slot.delete_item()

func protect_to_protect():
	for t in to_protect :
		var i=0
		for slot in to_delete :
			if(slot.itemType==t):
				to_delete[i]=null
				break
			i+=1

func count_items():
	for i in range(items.size()):
		items[i]=0
	for slot in slots:
		if(slot.itemType==-1):
			continue
		else:
			items[slot.itemType]+=1