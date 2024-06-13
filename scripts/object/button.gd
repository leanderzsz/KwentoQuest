extends StaticBody2D

var haspressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if haspressed == false:
		$AnimatedSprite2D.play("button_pressed")
		haspressed = true
		get_parent().numButtonPress += 1
	
