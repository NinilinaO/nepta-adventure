extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false

func _ready():
	if Global.cut_scene == true:
		if Global.card_4 == false:
			$card_4.visible = true
	
	if Global.current_scene == 2_1:
		$player.position.x = -417
		$player.position.y = -15
	if Global.current_scene == 2_2:
		$player.position.x = -322
		$player.position.y = -15

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused



func _on__21_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 3_1
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_2.tscn").call_deferred()


func _on__22_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 3_2
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_2.tscn").call_deferred()
