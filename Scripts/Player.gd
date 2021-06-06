extends KinematicBody2D

const UP = Vector2(0, 1)
const FLAP = 200
const MAXFALLSPEED = 200
const GRAVITY = 10

var motion = Vector2()

var score = 0

onready var label_score = $"../../GUI/Score"
onready var label_help = $"../../GUI/Help"
onready var end_timer = $"../../End"

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
	label_score.text = str(score)

	if GlobalVariables.storymodus:
		if score == 3:
			label_help.text = "Je hebt genoeg pillen verzameld!"
			label_help.show()
			end_timer.start(2.0)
			get_tree().paused = true
			
func _on_End_timeout():
	var _scene = get_tree().change_scene("res://Puzzle.tscn")
			
			

