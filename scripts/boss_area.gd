extends Node2D

func _process(delta):
	change_scene()

func _on_exit_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true

func _on_exit_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "boss_area":
			get_tree().change_scene_to_file("res://scenes/world.tscn")
			Global.third_finish_changescenes()
