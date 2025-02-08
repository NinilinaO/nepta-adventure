extends Node2D

@export var animation_player: AnimationPlayer
@export var autoplay : bool = false

func _input(event):
	if event.is_action_pressed("next") and not animation_player.is_playing():
		animation_player.play()
		get_tree().change_scene_to_file("res://scenes/end/end.tscn")

func pause():
	if autoplay == false:
		animation_player.pause()
