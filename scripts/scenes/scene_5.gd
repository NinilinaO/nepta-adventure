extends Node2D

@onready var player = $player
@onready var pause_menu = $PauseMenu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.cut_scene == true:
		if Global.card_5 == false:
			$card_5.visible = true
	
	if Global.current_scene == -1:
		$player.position.x = -50
		$player.position.y = -135
		Dialogic.start("Pepeta")
	if Global.current_scene == 4_1:
		$player.position.x = -114
		$player.position.y = -195
	if Global.current_scene == 4_2:
		$player.position.x = 14
		$player.position.y = -195
	if Global.current_scene == 6:
		$player.position.x = 14
		$player.position.y = -80
	if Global.current_scene == 7:
		$player.position.x = 137
		$player.position.y = -142


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		Dialogic.paused = false
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		Dialogic.paused = true
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused


func _on__41_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 5_1
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_4.tscn").call_deferred()


func _on__42_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 5_2
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_4.tscn").call_deferred()


func _on__6_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 5
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_6.tscn").call_deferred()


func _on__7_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 5
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_7.tscn").call_deferred()
