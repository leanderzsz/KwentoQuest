extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.from_level != null:
		$player.position = get_node(Global.from_level + "Pos").get_position()
	


