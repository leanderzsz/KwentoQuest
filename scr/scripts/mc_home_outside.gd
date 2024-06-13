extends Node2D

func _ready():
	if Global.from_level != null:
		$player.position = get_node(Global.from_level + "Pos").get_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
