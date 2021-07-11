extends Node2D

var wall = preload("res://WallNode.tscn")
var border = preload("res://BorderNode.tscn")

onready var label_score = $GUI/Score
onready var label_countdown = $GUI/Countdown
onready var label_help = $GUI/Help
onready var back_button = $Back
onready var help_button = $Help

func _ready():
	if GlobalVariables.storymodus == true:
		back_button.disabled = true
		help_button.disabled = true
		back_button.visible = false
		help_button.visible = false
		
	var wall_1 = wall.instance()
	wall_1.position = Vector2(344, 0)
	call_deferred("add_child", wall_1)

	var wall_2 = wall.instance()
	wall_2.position = Vector2(664, rand_range(-142, 142))
	call_deferred("add_child", wall_2)

	var wall_3 = wall.instance()
	wall_3.position = Vector2(984, rand_range(-142, 142))
	call_deferred("add_child", wall_3)

	var wall_4 = wall.instance()
	wall_4.position = Vector2(1304, rand_range(-142, 142))
	call_deferred("add_child", wall_4)

	if not GlobalVariables.storymodus:
		label_help.hide()

	get_tree().paused = true


func reset_wall():
	var instance = wall.instance()
	instance.position = Vector2(664, rand_range(-142, 142))
	call_deferred("add_child", instance)

func _on_Resetter_wall_area_entered(area):
	if area.name == "PointArea":
		reset_wall()
		var complete_wall = area.get_parent()		
		complete_wall.queue_free()

func reset_border():
	var instance = border.instance()
	instance.position = Vector2(512, -300)
	instance.z_index = 1
	call_deferred("add_child", instance)

func _on_Resetter_border_area_entered(area):
	if area.name == "BordersDetect":
		reset_border()
		var complete_border = area.get_parent()		
		complete_border.queue_free()

func _on_Start_timeout():
	label_countdown.hide()
	label_help.hide()
	label_score.show()
	get_tree().paused = false

func _on_Back_pressed():
	var _scene = get_tree().change_scene_to(load("res://TitleScreen.tscn"))

func _on_Help_pressed():
	var _scene = get_tree().change_scene_to(load("res://Instructions.tscn"))