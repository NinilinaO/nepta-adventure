extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.cut_scene == true:
		if Global.card_9 == false:
			$card_9.visible = true
		if Global.card_7 == false:
			$card_7.visible = true
	
	if Global.current_scene == 2:
		$player.position.x = -195
		$player.position.y = -390
	if Global.current_scene == 5_1:
		$player.position.x = -145
		$player.position.y = -265
	if Global.current_scene == 5_2:
		$player.position.x = -15
		$player.position.y = -265


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
		Global.current_scene = 4
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_2.tscn").call_deferred()


func _on__51_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 4_1
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_5.tscn").call_deferred()


func _on__52_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 4_2
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_5.tscn").call_deferred()
