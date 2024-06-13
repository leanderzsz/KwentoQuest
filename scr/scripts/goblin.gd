extends CharacterBody2D

var Knife = preload("res://scenes/Item/throwable_knife.tscn")

#var player_pos = 0

var speed= 40
var player_chase = false
var player = null

var health = 100
var player_inattack_zone = false
var can_take_damage = true

@onready var player_pos = get_node("/root/FDRoom2/player")
@onready var spawn_point = $Spawn

func _physics_process(delta):
	deal_with_damage()
	update_heath()
	
#	var dist = global_position.direction_to(player_pos.global_position)
#	look_at(player_pos.global_position)

#	if player_chase:
#		position += (player.position - position)/speed
#
#		$AnimatedSprite2D.play("walk")
#
#		if(player.position.x - position.x) < 0:
#			$AnimatedSprite2D.flip_h = true
#		else:
#			$AnimatedSprite2D.flip_h = false
#	else:
#		$AnimatedSprite2D.play("idle")

func _on_detection_area_body_entered(body):
#	print(body.name)
#	player_pos = body.position
#	print(player_pos.angle())
#	print(rad_to_deg(player_pos.angle()))
	throw()
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	
	player = null
	player_chase = false

func throw():
#	print("knife has been thrown")
	var knife = Knife.instantiate()
	knife.position = spawn_point.global_position
	get_parent().add_child(knife)
#
	var knife_rotation= self.global_position.direction_to(player_pos.position)
	var knife_xyAdd = (knife_rotation.x + knife_rotation.y) * 100 
	print(knife_xyAdd)
	Global.player_xy = knife_xyAdd
func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false

func deal_with_damage():
	if player_inattack_zone and Global.player_current_attack == true:
		if can_take_damage == true:
			health = health - 20
			$Take_Damage_Timer.start()
			can_take_damage = false
			print("slime health = " , health)
			if health <= 0:
				self.queue_free()


func _on_take_damage_timer_timeout():
	can_take_damage = true

func update_heath():
	var healthbar = $healthbar
	
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true
	
