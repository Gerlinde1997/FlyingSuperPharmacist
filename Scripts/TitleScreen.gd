extends Control

var _flygame_connect
var _storyline_connect

func _ready():
	_flygame_connect = $FlyGame.connect("pressed", self, "_on_FlyGame_pressed")
	_storyline_connect = $Storyline.connect("pressed", self, "_on_Storyline_pressed")
	
	if get_tree().paused:
		get_tree().paused = false

func _on_Storyline_pressed():
	GlobalVariables.storymodus = true
	var _scene = get_tree().change_scene_to(load("res://Story_1.tscn"))

func _on_FlyGame_pressed():
	GlobalVariables.storymodus = false
	var _scene = get_tree().change_scene_to(load("res://Flying.tscn"))
