extends RigidBody2D

@export var mu_static = 0.8
@export var mu_moving = 0.5 

@export var move_strength = 1

var is_touching = false

var applied_forces: Vector2 = Vector2(0, 0)

func add_force_for_frame(force: Vector2):
	# add_force adds a permanent force, for a temporary one we need to wipe it
	# by undo the force next frame, just keep track of forces applied
	applied_forces += force
	self.apply_central_force(force)

func _ready() -> void:
	# no world gravity pushing the object down (in the +y) direction
	# we are top down so gravity is acting into the screen (in +z) but the
	# "ground" normal force is canceling it out
	self.gravity_scale = 0

func _physics_process(delta: float) -> void:
	add_force_for_frame(-applied_forces) # wipe out previous forces

	# arrows keys apply force to move it
	# could equally have a different body which pushes it
	
	if is_touching == true:
		if Input.is_action_pressed("ui_right"):
			self.add_force_for_frame(move_strength * Vector2(1, 0))
		if Input.is_action_pressed("ui_left"):
			self.add_force_for_frame(move_strength * Vector2(-1, 0))
		if Input.is_action_pressed("ui_up"):
			self.add_force_for_frame(move_strength * Vector2(0, -1))
		if Input.is_action_pressed("ui_down"):
			self.add_force_for_frame(move_strength * Vector2(0, 1))

func _on_area_2d_body_entered(body):
	print("body entered is " + body.name)
	set_sleeping (false)
	if(body.name == "player"):
		is_touching = true

func _on_area_2d_body_exited(body):
	print("body is existed")
	set_sleeping (true)
	is_touching = false
