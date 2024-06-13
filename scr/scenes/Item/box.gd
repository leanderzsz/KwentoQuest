extends "res://scripts/Items/box.gd"

@export var move_strength = 1

var applied_forces: Vector2 = Vector2(0, 0)

func add_force_for_frame(force: Vector2):
	# add_force adds a permanent force, for a temporary one we need to wipe it
	# by undo the force next frame, just keep track of forces applied
	applied_forces += force
	#self.apply_central_force(force)

func _physics_process(delta):
	add_force_for_frame(-applied_forces)
	
	if Input.is_action_pressed("ui_right"):
		self.add_force_for_frame(move_strength * Vector2(1, 0))
	if Input.is_action_pressed("ui_left"):
		self.add_force_for_frame(move_strength * Vector2(-1, 0))
	if Input.is_action_pressed("ui_up"):
		self.add_force_for_frame(move_strength * Vector2(0, -1))
	if Input.is_action_pressed("ui_down"):
		self.add_force_for_frame(move_strength * Vector2(0, 1))
