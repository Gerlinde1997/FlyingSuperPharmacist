extends Control

var _back_connect
var _play_connect

func _ready():
	get_tree().paused = false
	_back_connect = $Back.connect("pressed", self, "_on_Back_pressed")
	_play_connect = $Play.connect("pressed", self, "_on_Play_pressed")

func _on_Back_pressed():
	var _scene = get_tree().change_scene("res://TitleScreen.tscn")

func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://Flying.tscn")