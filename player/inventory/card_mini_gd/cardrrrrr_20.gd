extends StaticBody2D

var player_in_area = false

func _ready():
	pass

func _process(_delta):
	if player_in_area:
		if Input.is_action_just_pressed("e"):
			Dialogic.VAR.count_card = 20

func DialogicSignal(arg: String):
	pass

func _on_chat_detection_body_entered(body):
	if body.has_method("player"):
		player_in_area = true

func _on_chat_detection_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
