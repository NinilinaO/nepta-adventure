extends StaticBody2D

var player_in_area = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func _process(_delta):
	if player_in_area:
		if Input.is_action_just_pressed("e"):
			run_dialogue("Kayla")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == 'card_16':
		Global.card_16 = true
	elif arg == 'card_18':
		Global.card_18 = true

func _on_chat_detection_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_chat_detection_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
