extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false

func _ready():
	if Global.cut_scene == true:
		if Global.card_1 == false:
			$card_1.visible = true
		if Global.card_2 == false:
			$card_2.visible = true
		if Global.card_3 == false:
			$card_3.visible = true

	if Global.current_scene == 1:
		$player.position.x = -425
		$player.position.y = -355
	if Global.current_scene == 3_1:
		$player.position.x = -350
		$player.position.y = -140
	if Global.current_scene == 3_2:
		$player.position.x = -250
		$player.position.y = -140
	if Global.current_scene == 4:
		$player.position.x = -105
		$player.position.y = -230

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

func _on__1_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 2
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_1.tscn").call_deferred()


func _on__31_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 2_1
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_3.tscn").call_deferred()


func _on__32_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 2_2
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_3.tscn").call_deferred()


func _on__4_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 2
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_4.tscn").call_deferred()
