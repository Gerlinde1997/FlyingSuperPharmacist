extends StaticBody2D

var speed = -3

func _ready(): 
	pass

func _physics_process(_delta):
	position += Vector2(speed, 0)
