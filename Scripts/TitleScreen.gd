extends Control

func _on_Storyline_pressed():
	GlobalVariables.storymodus = true
	SceneChanger.goto_scene("res://Story_1.tscn")

func _on_FlyGame_pressed():
	GlobalVariables.storymodus = false
	SceneChanger.goto_scene("res://Flying.tscn")
