extends KinematicBody2D

const UP = Vector2(0, 1)
const FLAP = 200
const MAXFALLSPEED = 200
const GRAVITY = 10

var motion = Vector2()
var wall = preload("res://WallNode.tscn")
onready var walls = $"../../WallNode/Walls"

var score = 0

func _ready():
	pass # Replace with function body.

func reset():
	var instance = wall.instance()
	instance.position = Vector2(800, rand_range(-256, 256))
	get_parent().call_deferred("add_child", instance)

func _on_Resetter_body_entered(body):
	if body.name == "Walls":
		reset()
		body.queue_free()

func _on_Detection_area_entered(area):
	if area.name == "PointArea":
		score += 1
		area.queue_free()


func _on_Detection_body_entered(body):
	if body.name == "Walls":
		get_tree().reload_current_scene()


func _physics_process(_delta):

	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("flap"):
		motion.y = -FLAP
	
	motion = move_and_slide(motion, UP)

func _process(_delta):
	$"../../CanvasLayer/Label".text = str(score)
