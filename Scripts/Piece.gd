extends KinematicBody2D

var dragging = false

signal dragsignal
var dragsignal

func _ready():
	dragsignal = connect("dragsignal",self,"_set_drag_pc")
	
func _process(_delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)
		self.modulate = Color(1, 1, 1, 1)
	else:
		self.modulate = Color(1, 1, 1, 0.5)

func _set_drag_pc():
	dragging=!dragging

func _on_KinematicBody2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")
