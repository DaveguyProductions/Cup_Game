extends CanvasLayer

# signal from logos to menu
signal transition 


func _ready():
	fade_to_clear()


func fade_to_clear():
	$AnimationPlayer.play("fade_to_clear")


func fade_to_black():
	$AnimationPlayer.play("fade_to_black")
	
func _on_dave_guy_fanfare_2_finished() -> void:
	$AnimationPlayer.play("fade_to_black")
	

	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_to_black":
		emit_signal("transition")
