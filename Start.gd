extends Timer

onready var label_score = $"../GUI/Score"
onready var label_countdown = $"../GUI/Countdown"

func _ready():
	label_score.visible = false

func _process(_delta):
	label_countdown.text = str(stepify(get_time_left(), 0.1))
