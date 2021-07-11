extends Control

var _back_connect

func _ready():
	get_tree().paused = false
	_back_connect = $Back.connect("pressed", self, "_on_Back_pressed")

func _on_Back_pressed():
	var _scene = get_tree().change_scene("res://TitleScreen.tscn")
