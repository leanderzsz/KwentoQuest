extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.game_first_loadin == true:
		$player.position.x = Global.player_start_posx
		$player.position.y = Global.player_start_posy
	elif Global.transition_scene == true:
		$player.position.x = Global.player_exit_cliftside_posx
		$player.position.y = Global.player_exit_cliftside_posy
	elif Global.transition_beach == true:
		$player.position.x = Global.player_exit_beach_posx
		$player.position.y = Global.player_exit_beach_posy
	elif Global.transition_bossArea == true:
		$player.position.x = Global.player_exit_bossArea_posx
		$player.position.y = Global.player_exit_bossArea_posy


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()


func _on_cliff_side_transition_point_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true


func _on_cliff_side_transition_point_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/cliff_side.tscn")
			Global.game_first_loadin = false
			Global.finish_changescenes()
	elif Global.transition_beach == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/beach.tscn")
			Global.game_first_loadin = false
			Global.second_finish_changescenes()
	elif Global.transition_bossArea == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/boss_area.tscn")
			Global.game_first_loadin = false
			Global.third_finish_changescenes()


func _on_beach_transition_point_body_entered(body):
	if body.has_method("player"):
		Global.transition_beach = true


func _on_beach_transition_point_body_exited(body):
	if body.has_method("player"):
		Global.transition_beach = false


func _on_boss_area_body_entered(body):
	if body.has_method("player"):
		Global.transition_bossArea = true


func _on_boss_area_body_exited(body):
	if body.has_method("player"):
		Global.transition_bossArea = false
