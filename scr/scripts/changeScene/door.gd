extends StaticBody2D

func _ready():
	if self.name in Global.opened_doors:
		queue_free()

func _on_area_2d_body_entered(body):
	if self.name in Global.key_founded:
		$AnimationPlayer.play("Open")
		#yield($AnimationPlayer,"animation_finished")
		await $AnimationPlayer.animation_finished
		Global.opened_doors.append(self.name)
		queue_free()
	
	if not self.name in Global.key_founded:
		$AnimationPlayer.play("Closed")
