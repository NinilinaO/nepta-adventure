extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.cut_scene == true:
		if Global.card_6 == false:
			$card_6.visible = true
	
	if Global.current_scene == 7:
		$player.position.x = 399
		$player.position.y = -120
	if Global.current_scene == 10:
		$player.position.x = 383
		$player.position.y = -403


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


func _on__10_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 9
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_10.tscn").call_deferred()


func _on__7_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 9
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_7.tscn").call_deferred()
