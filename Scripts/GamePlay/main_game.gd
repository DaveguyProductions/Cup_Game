extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		Globals.game_state = false
		get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
