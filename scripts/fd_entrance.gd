extends Node2D

var Map =preload("res://scenes/game_systems/fd_minimap.tscn")
var enemy_defeated = 0


func _ready():
	print(self.name)
	var current_room = self.name
	if not current_room in Global.visited:
		Global.visited.append(current_room)
		#var room_name = level.instance()
		#var room_name = level.instantiate()
		#add_child(level_name)
	
	if Global.from_level != null:
		$player.position = get_node(Global.from_level + "Pos").get_position()



func _input(_event):
	if Input.is_action_just_pressed("map"):
		if not has_node("fd_minimap"):
			#var map = Map.instance()
			var map = Map.instantiate()
			add_child(map)
			get_tree().paused = true

