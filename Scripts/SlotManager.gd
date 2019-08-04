extends Node2D

export(bool) var rightside=true
var slots
var items= []
var to_delete=[]
var fish_turn=false
var wolf_turn=false
func _ready():
	slots=get_children()
	fish_turn=false
	wolf_turn=false
	for type in ItemManager.ItemType :
		items.append(0)

func check():
	count_items()
	print(items)
	# Chicken eat Snake
	if(items[ItemManager.ItemType.Chicken]>0 and items[ItemManager.ItemType.Snake]>0):
		for i in range(min(items[ItemManager.ItemType.Chicken],items[ItemManager.ItemType.Snake])):
			delete(ItemManager.ItemType.Snake)
	# Wolf eat Chicken Dog protect Chicken
	if(items[ItemManager.ItemType.Wolf] - items[ItemManager.ItemType.Dog]>0 and items[ItemManager.ItemType.Chicken]>0):
		for i in range(min(items[ItemManager.ItemType.Wolf],items[ItemManager.ItemType.Chicken])):
			delete(ItemManager.ItemType.Chicken)
	# Snake eat Dog
	if(items[ItemManager.ItemType.Snake]>0 and items[ItemManager.ItemType.Dog]>0):
		for i in range(min(items[ItemManager.ItemType.Snake],items[ItemManager.ItemType.Dog])):
			delete(ItemManager.ItemType.Dog)
	#Crocodile eat fish 2 turn 
	if(items[ItemManager.ItemType.Crocodile]>0):
		if(items[ItemManager.ItemType.Fish]>0):
			if(fish_turn):
				for i in range(min(items[ItemManager.ItemType.Crocodile],items[ItemManager.ItemType.Fish])):
					delete(ItemManager.ItemType.Fish)
			else:
				fish_turn=true
		else:
			fish_turn=false
		if(items[ItemManager.ItemType.Wolf]):
			if(wolf_turn):
				for i in range(min(items[ItemManager.ItemType.Crocodile],items[ItemManager.ItemType.Wolf])):
					delete(ItemManager.ItemType.Wolf)
			else:
				wolf_turn=true
		else:
			wolf_turn=false
	else:
		fish_turn=false
		wolf_turn=false
	delete_to_delete()

func check_win():
	count_items()
	print("checkwin : ")
	print(str("level : ",LevelManager.current_level))
	print(str("items :",items))
	print(str("win :",LevelManager.levels[LevelManager.current_level]))
	var type=0
	for i in LevelManager.levels[LevelManager.current_level]:
		if(items[type]<i):
			return
		type+=1
	LevelManager.win()

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