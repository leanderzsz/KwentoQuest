extends Control

func _on_button_pressed():
	Global.player_health = 100
	get_tree().change_scene_to_file("res://scenes/mc_home.tscn")
