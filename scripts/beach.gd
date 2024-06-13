extends Node2D

func _process(delta):
	beach_change_scene()

func _on_beach_exit_body_entered(body):
	if body.has_method("player"):
		Global.transition_beach = true

func _on_beach_exit_body_exited(body):
	if body.has_method("player"):
		Global.transition_beach = false

func beach_change_scene():
	if Global.transition_beach == true:
		if Global.current_scene == "beach":
			get_tree().change_scene_to_file("res://scenes/world.tscn")
			Global.second_finish_changescenes()
