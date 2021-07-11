extends Node
class_name DialoguePlayer

signal finished

var title
var text
var portrait_position
var expression

var _conversation = []
var _index_current
var end_index = GlobalVariables.end_index

func start(text_dict, start_index):
	_conversation = text_dict.values()
	_index_current = start_index
	_update()

func next():
	_index_current += 1
	_update()

func _update():
	text = _conversation[_index_current].text
	title = _conversation[_index_current].name
	portrait_position = _conversation[_index_current].pos
	expression = _conversation[_index_current].expression
	if _index_current == end_index - 1:
		emit_signal("finished")
