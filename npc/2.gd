extends StaticBody2D

var player_in_area = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func _process(_delta):
	if player_in_area:
		if Input.is_action_just_pressed("e"):
			run_dialogue("Trina")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == "card_13":
		Global.card_13 = true
	elif arg == "card_21":
		Global.card_21 = true
	elif arg == "card_24":
		Global.card_24 = true

func _on_chat_detection_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_chat_detection_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
