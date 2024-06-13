extends Area2D

var dir = 1.5
var SPEED: int = 5

@onready var player_pos = get_node("/root/FDRoom2/player")

func _physics_process(delta):
	
	#look_at(player_pos.global_position)
	var mov_dir = Vector2(1,0).rotated(dir)
	global_position += (mov_dir * SPEED)

func destroy():
	queue_free()

func _on_area_entered(area):
	print(area.name)
	destroy()


func _on_body_entered(body):
	destroy()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
