extends Node

const ItemClass=preload("ItemClass.gd")
var rightside=true
enum ItemType{Sheep, Wolf, Laitue, Dog  }
var typeCount=3
var Items = []
func _ready():
	Items.append(ItemClass.new(ItemType.Sheep,[ItemType.Laitue],[],[]))
	Items.append(ItemClass.new(ItemType.Wolf,[ItemType.Sheep],[],[]))
	Items.append(ItemClass.new(ItemType.Laitue,[],[],[]))

