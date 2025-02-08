extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.current_scene == 9:
		$player.position.x = 216
		$player.position.y = -490


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


func _on__9_body_entered(body):
	if body.has_method("player"):
		Global.current_scene = 10
		get_tree().change_scene_to_file.bind("res://scenes/scenes/scene_9.tscn").call_deferred()
