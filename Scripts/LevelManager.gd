extends Node

var WinScreen=preload("res://Scenes/WinScreen.tscn")

var levels=[
[1,1,1,0,0,0],
[1,1,1,1,0,0],
[1,1,1,1,1,1],
[1,1,1,1,1,1]
]
var current_level=-1
var unlocked=0
func win():
	print("win")
	var node = WinScreen.instance()
	get_tree().get_root().get_node("Root").add_child(node)
	if(unlocked<current_level+1):
		unlocked=current_level+1


func load_next_level():
	print(str("current : ",current_level))
	print(str("max : ",levels.size()-1))
	if(current_level<levels.size()-1):
		load_level(current_level+1)
	else:
		get_tree().change_scene("res://Scenes/EndScene.tscn")

func load_level(i):
	if(i<=unlocked):
		get_tree().change_scene(str("res://Scenes/Levels/Level",i,".tscn"))
		current_level=i

func reload_level():
	load_level(current_level)

func main_menu():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func load_credits():
		get_tree().change_scene("res://Scenes/Credits.tscn")