extends CharacterBody2D

var Knife = preload("res://scenes/Item/fireball.tscn")

var attack = false
var in_attack_range = false

var health = 100
var player_inattack_zone = false
var can_take_damage = true

var speed = 1
var is_going_right = false


@onready var spawn_point = $Spawn

func _physics_process(delta):
	deal_with_damage()
	update_heath()
	
	$AnimatedSprite2D.play("default")
	
	if(is_going_right == true):
		global_position.x += speed
	elif(is_going_right == false):
		global_position.x -= speed
	else:
		global_position.x += speed
	
#	if(attack == true):
#		throw()
#		attack = false
#		$Attack_cooldown.start()
		

func _on_left_body_entered(body):
	print(body.name)
	if body.name != "player":
		is_going_right = false


func _on_right_body_entered(body):
	print(body.name)
	if body.name != "player":
		is_going_right = true

func _on_area_2d_body_entered(body):
	speed = 0
	in_attack_range = true
	$AnimatedSprite2D.stop()
#	attack = true
	throw()
	$Attack_cooldown.start()
	

func deal_with_damage():
	if player_inattack_zone and Global.player_current_attack == true:
		if can_take_damage == true:
			health = health - 20
			$Take_Damage_Timer.start()
			can_take_damage = false
			print("slime health = " , health)
			if health <= 0:
				get_parent().boss_defeated = true
				self.queue_free()

func _on_area_2d_body_exited(body):
	speed = 1
	in_attack_range = false
#	attack = false
	$AnimatedSprite2D.play("default")

func throw():
#	print("knife has been thrown")
	var knife = Knife.instantiate()
	knife.position = spawn_point.global_position
	
	get_parent().add_child(knife)
	
	$Attack_cooldown.start()

func _on_attack_cooldown_timeout():
	if in_attack_range == true:
		throw()


func _on_h_it_box_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true


func _on_h_it_box_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false

func _on_take_damage_timer_timeout():
	can_take_damage = true

func update_heath():
	var healthbar = $healthbar

	healthbar.value = health

	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true

