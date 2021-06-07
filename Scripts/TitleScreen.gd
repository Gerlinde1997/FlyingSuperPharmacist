extends Control

var _flygame_connect
var _storyline_connect
var _instructions_connect

func _ready():
	_flygame_connect = $FlyGame.connect("pressed", self, "_on_FlyGame_pressed")
	_storyline_connect = $Storyline.connect("pressed", self, "_on_Storyline_pressed")
	_instructions_connect = $Instruc.connect("pressed", self, "_on_Instruc_pressed")

func _on_Storyline_pressed():
	GlobalVariables.storymodus = true
	var _scene = get_tree().change_scene("res://Story_1.tscn")

func _on_FlyGame_pressed():
	GlobalVariables.storymodus = false
	var _scene = get_tree().change_scene("res://Flying.tscn")

func _on_Instruc_pressed():
	var _scene = get_tree().change_scene("res://Instructions.tscn")