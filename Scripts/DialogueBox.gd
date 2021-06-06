extends Control
class_name DialogueBox

signal dialogue_ended
signal koala_down

onready var dialogue_player = $DialoguePlayer

onready var portrait_right = $PortraitRight
onready var portrait_left = $PortraitLeft

onready var button_next = $Panel/Next
onready var button_end = $Panel/End

onready var name_label = $Panel/Name
onready var text_label = $Panel/Text

onready var dialogue_dict = JsonData.dialogue_data

func _ready():
	start(dialogue_dict)

func start(dialogue):
	button_end.hide()
	button_next.show()
	dialogue_player.start(dialogue)
	update_content()
	show()

func _on_Next_pressed():
	dialogue_player.next()
	update_content()

func _on_DialoguePlayer_finished():
	button_next.hide()
	button_end.show()

func _on_End_pressed():
	emit_signal("dialogue_ended")
	hide()

func portrait_textures():
	if dialogue_player.expression == "empty":
		return StyleBoxEmpty
	else:
		var texture_path = "res://Sprites/{title}_{expression}.png".format({"title": dialogue_player.title, "expression": dialogue_player.expression})
		var portrait = load(texture_path)
		return portrait

func update_content():
	if dialogue_player.title == "Koala":
		emit_signal("koala_down")
	
	name_label.text = dialogue_player.title
	text_label.text = dialogue_player.text
	if dialogue_player.portrait_position == "right":
		$PortraitLeft.modulate = Color(1, 1, 1, 0.75)
		$PortraitRight.texture = portrait_textures()
		$PortraitRight.modulate = Color(1, 1, 1, 1)
	if dialogue_player.portrait_position == "left":
		$PortraitRight.modulate = Color(1, 1, 1, 0.75)
		$PortraitLeft.texture = portrait_textures()
		$PortraitLeft.modulate = Color(1, 1, 1, 1)
