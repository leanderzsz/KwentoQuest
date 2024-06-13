extends Control
#get_tree().change_scene_to_file("res://scenes/mc_home.tscn")

func _on_button_pressed():
	$I1.visible = false

func _on_button_2_pressed():
	$I2.visible = false

func _on_button_3_pressed():
	$I3.visible = false

func _on_button_4_pressed():
	$I4.visible = false

func _on_button_5_pressed():
	$I5.visible = false

func _on_button_6_pressed():
	$I6.visible = false

func _on_button_7_pressed():
	$I7.visible = false

func _on_button_8a_pressed():
	$I8/Textbox6.visible = false
	$I8/Button8A.visible = false
	$I8/Beach.visible = true

func _on_button_8b_pressed():
	$I8/Textbox7.visible = false
	$I8/Button8B.visible = false
	$I8/Forest.visible = true

func _on_button_8c_pressed():
	$I8/Textbox8.visible = false
	$I8/Button8C.visible = false
	$I8/Mountain.visible = true

func _on_button_8d_pressed():
	$I8.visible = false
	

func _on_button_9a_pressed():
	$I9/Textbox7.visible = false
	$I9/Button9A.visible = false
	$I9/Godess1.visible = true
	$I9/Godess2.visible = true
	$I9/Godess3.visible = true

func _on_button_9b_pressed():
	$I9/Textbox8.visible = false
	$I9/Button9B.visible = false
	$I9/Sunrise.visible = true
	$I9/Star.visible = true
	$I9/Crescent.visible = true

func _on_button_9c_pressed():
	$I9.visible = false

func _on_button_10_pressed():
	$I10.visible = false

func _on_button_11_pressed():
	get_tree().change_scene_to_file("res://scenes/mc_home.tscn")
