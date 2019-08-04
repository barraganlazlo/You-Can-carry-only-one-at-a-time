extends Node

const Level = preload("res://Scripts/Level.gd")
var levels=[
Level.new([ItemManager.ItemType.Sheep,ItemManager.ItemType.Wolf,ItemManager,ItemManager.ItemType.Laitue]),
Level.new([ItemManager.ItemType.Sheep,ItemManager.ItemType.Wolf,ItemManager,ItemManager.ItemType.Laitue,ItemManager.ItemType.Dog])

]
var current_level=-1