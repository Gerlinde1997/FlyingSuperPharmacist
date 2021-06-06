extends StaticBody2D

var speed = -8

func _ready():
	var node = get_parent()
	node.scale = Vector2(0.5, 0.5)

func _physics_process(_delta):
	self.position += Vector2(speed, 0)
