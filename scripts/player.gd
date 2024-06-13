extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

var attack_ip = false

const speed = 100
var current_dir = "none"

#var beenHit = false

@export var inv: Inv

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	attack()
	current_camera()
	update_health()
	
	
	if Global.player_health <= 0:
		player_alive = false
		Global.player_health = 0
		print("player has been killed")
		get_tree().change_scene_to_file("res://scenes/game_systems/game_over.tscn")
	
func player_movement(_delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	

	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("side_idle")
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("front_idle")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("back_idle")

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		Global.player_health = Global.player_health - 20
		enemy_attack_cooldown = false
		$Attack_Cooldown.start()
		print(Global.player_health)

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

func attack():
	var dir = current_dir
	
	if Input.is_action_just_pressed("attack"):
		Global.player_current_attack = true
		attack_ip = true
		if dir == "right":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side_attack")
			$Deal_Attack_Timer.start()
		if dir == "left":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side_attack")
			$Deal_Attack_Timer.start()
		if dir == "down":
			$AnimatedSprite2D.play("front_attack")
			$Deal_Attack_Timer.start()
		if dir == "up":
			$AnimatedSprite2D.play("back_attack")
			$Deal_Attack_Timer.start()

func _on_deal_attack_timer_timeout():
	$Deal_Attack_Timer.stop()
	Global.player_current_attack = false
	attack_ip = false

func current_camera():
	if Global.current_scene == "world":
		$World_Camera.enabled = true
		$Cliftside_Camera.enabled = false
	elif Global.current_scene == "cliff_side":
		$World_Camera.enabled = false
		$Cliftside_Camera.enabled = true
		

func update_health():
	var healthbar = $healthbar
	
	healthbar.value = Global.player_health
	
	if Global.player_health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true

func _on_regin_timer_timeout():
	if Global.player_health < 100:
		Global.player_health = Global.player_health + 40
		if Global.player_health > 100:
			Global.player_health= 100
	if Global.player_health <= 0:
		Global.player_health = 0

func collect(item):
	inv.insert(item)

#func beenHitFunc(name):
#	if beenHit == true:
#		print("been hit")
#	else:
#		print("not hit")
