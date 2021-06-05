extends KinematicBody2D

const UP = Vector2(0, 1)
const FLAP = 200
const MAXFALLSPEED = 200
const GRAVITY = 10

var motion = Vector2()

var score = 0

func _ready():
	pass # Replace with function body.

func _on_Detection_area_entered(area):
	if area.name == "PointArea":
		score += 1
		area.get_node("Sprite").visible = false

func _on_Detection_body_entered(body):
	if body.name == "Walls" or body.name == "Borders":
		var _scene = get_tree().reload_current_scene()

func _physics_process(_delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("flap"):
		motion.y = -FLAP
	
	motion = move_and_slide(motion, UP)

func _process(_delta):
	$"../../GUI/Label".text = str(score)
