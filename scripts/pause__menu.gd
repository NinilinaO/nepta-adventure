extends Control

@export var game_meneger : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_game_manager_toggle_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()
