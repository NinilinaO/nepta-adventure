extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false

func _ready():
	if Global.cut_scene == true:
		if Global.card_10 == false:
			$card_10.visible = true
	if Global.current_scene == 2:
		$player.position.x = -250
		$player.position.y = -560

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

func _on__2_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 1
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_2.tscn").call_deferred()
