extends StaticBody2D

var player_in_area = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func _process(_delta):
	if player_in_area:
		if Input.is_action_just_pressed("e"):
				run_dialogue("Pepeta")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == "cut_scene":
		Global.cut_scene = true
		get_tree().change_scene_to_file("res://scenes/scenes/cut_scene.tscn")
		Dialogic.VAR.dialogue.cut_scene = true
	elif arg == "cut_scene2":
		get_tree().change_scene_to_file("res://scenes/cut_scene2/cut_scene_2.tscn")

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
