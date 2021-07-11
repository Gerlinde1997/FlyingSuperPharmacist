extends Node2D

func _ready():
	get_tree().paused = false
	$KoalaBed.visible = true

func _on_DialogueBox_dialogue_ended():
	$KoalaBed.visible = true
	$End.start(1.0)

func _on_DialogueBox_koala_down():
	$KoalaBed.visible = false

func _on_End_timeout():
	GlobalVariables.start_index = 0
	GlobalVariables.end_index = 10
	GlobalVariables.storymodus = false
	var _scene = get_tree().change_scene_to(load("res://End.tscn"))
