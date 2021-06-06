extends Node2D

func _ready():
	$KoalaBed.visible = true

func _on_DialogueBox_dialogue_ended():
	$KoalaBed.visible = true
	$End.start(1.0)

func _on_DialogueBox_koala_down():
	$KoalaBed.visible = false

func _on_End_timeout():
	SceneChanger.goto_scene("res://Flying.tscn")
	