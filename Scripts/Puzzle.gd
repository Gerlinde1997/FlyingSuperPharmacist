extends Node2D

func _ready():
	if get_tree().paused:
		get_tree().paused = false
