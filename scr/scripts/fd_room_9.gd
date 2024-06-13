extends Node2D

var Map =preload("res://scenes/game_systems/fd_minimap.tscn")
var enemy_defeated = 0
var open_door = false
# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.name)
	var current_room = self.name
	if not current_room in Global.visited:
		Global.visited.append(current_room)
	
	if Global.from_level != null:
		$player.position = get_node(Global.from_level + "Pos").get_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_defeated > 2:
		open_door = true
	pass

func _input(_event):
	if Input.is_action_just_pressed("map"):
		if not has_node("fd_minimap"):
			#var map = Map.instance()
			var map = Map.instantiate()
			add_child(map)
			get_tree().paused = true


