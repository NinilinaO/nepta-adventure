extends StaticBody2D

var player_in_area = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func _process(_delta):
	if player_in_area:
		if Input.is_action_just_pressed("e"):
			run_dialogue("Sigrid")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == "platf":
		get_tree().change_scene_to_file("res://scenes/planet1/planet_1.tscn")
	elif arg == 'card_22_23':
		Global.card_22 = true
		Global.card_23 = true

func _on_chat_detection_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_chat_detection_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
