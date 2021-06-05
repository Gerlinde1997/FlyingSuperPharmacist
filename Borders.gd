extends StaticBody2D

var speed = -4

func _ready():
	pass

func _physics_process(_delta):
	self.position += Vector2(speed, 0)
