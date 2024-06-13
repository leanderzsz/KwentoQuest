extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if self.name in Global.opened_doors:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().open_door == true:
		queue_free()
#	_check_if_enemy_cleared()

#func _check_if_enemy_cleared():
#	if Global.fd_room_8_cleard == true:
#		$AnimationPlayer.play("Open")
#		Global.opened_doors.append(self.name)
#		queue_free()


func _on_area_2d_body_entered(body):
	$AnimationPlayer.play("Closed")
