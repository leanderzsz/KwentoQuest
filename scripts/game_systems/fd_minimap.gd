extends ColorRect

var visited = Global.visited

func _ready():
	hide_map()
	blink()
	if Global.bossKeyGet == true:
		$SkullKey.visible = false

func hide_map():
	if "FDEntrance" in visited:
		$fd_entrance/hide.visible = false
	if "FDRoom1" in visited:
		$fd_room_1/hide.visible = false
	if "FDRoom2" in visited:
		$fd_room_2/hide.visible = false
	if "FDRoom3" in visited:
		$fd_room_3/hide.visible = false
	if "FDRoom4" in visited:
		$fd_room_4/hide.visible = false
	if "FDRoom5" in visited:
		$fd_room_5/hide.visible = false
	if "FDRoom6" in visited:
		$fd_room_6/hide.visible = false
	if "FDRoom7" in visited:
		$fd_room_7/hide.visible = false
	if "FDRoom_8" in visited:
		$fd_room_8/hide.visible = false
	if "FDRoom9" in visited:
		$fd_room_9/hide.visible = false
	if "FDRoom10" in visited:
		$fd_room_10/hide.visible = false
	if "FDRoom11" in visited:
		$fd_room_11/hide.visible = false
	if "FDRoom12" in visited:
		$fd_room_12/hide.visible = false
	if "FDRoom13" in visited:
		$fd_room_13/hide.visible = false
	if "FDRoom14" in visited:
		$fd_room_14/hide.visible = false
	if "FDRoom15" in visited:
		$fd_room_15/hide.visible = false
	if "FDRoom16" in visited:
		$fd_room_16/hide.visible = false
	if "FDRoom17" in visited:
		$fd_room_17/hide.visible = false
	if "FDRoom18" in visited:
		$fd_room_18/hide.visible = false
	if "FDBossRoom" in visited:
		$fd_boss_room/hide.visible = false

func blink():
	if get_parent().name == "FDEntrance":
		#$location_name.text = "fd_entrance"
		#$position.text = ""
		$position.text = "Entranced"
		$fd_entrance/blink.visible = true
	if get_parent().name == "FDRoom1":
		$position.text = "Room 1"
		$fd_room_1/blink.visible = true
	if get_parent().name == "FDRoom2":
		$position.text = "Room 2"
		$fd_room_2/blink.visible = true
	if get_parent().name == "FDRoom3":
		$position.text = "Room 3"
		$fd_room_3/blink.visible = true
	if get_parent().name == "FDRoom4":
		$position.text = "Room 4"
		$fd_room_4/blink.visible = true
	if get_parent().name == "FDRoom5":
		$position.text = "Room 5"
		$fd_room_5/blink.visible = true
	if get_parent().name == "FDRoom6":
		$position.text = "Room 6"
		$fd_room_6/blink.visible = true
	if get_parent().name == "FDRoom7":
		$position.text = "Room 7"
		$fd_room_7/blink.visible = true
	if get_parent().name == "FDRoom8":
		$position.text = "Room 8"
		$fd_room_8/blink.visible = true
	if get_parent().name == "FDRoom9":
		$position.text = "Room 9"
		$fd_room_9/blink.visible = true
	if get_parent().name == "FDRoom10":
		$position.text = "Room 10"
		$fd_room_10/blink.visible = true
	if get_parent().name == "FDRoom11":
		$position.text = "Room 11"
		$fd_room_11/blink.visible = true
	if get_parent().name == "FDRoom12":
		$position.text = "Room 12"
		$fd_room_12/blink.visible = true
	if get_parent().name == "FDRoom13":
		$position.text = "Room 13"
		$fd_room_13/blink.visible = true
	if get_parent().name == "FDRoom14":
		$position.text = "Room 14"
		$fd_room_14/blink.visible = true
	if get_parent().name == "FDRoom15":
		$position.text = "Room 15"
		$fd_room_15/blink.visible = true
	if get_parent().name == "FDRoom16":
		$position.text = "Room 16"
		$fd_room_16/blink.visible = true
	if get_parent().name == "FDRoom17":
		$position.text = "Room 17"
		$fd_room_17/blink.visible = true
	if get_parent().name == "FDRoom18":
		$position.text = "Room 18"
		$fd_room_18/blink.visible = true
	if get_parent().name == "FDBossRoom":
		$position.text = "Boss Room"
		$fd_boss_room/blink.visible = true

func _input(_event):
	if Input.is_action_just_pressed("map"):
		get_tree().paused = false
		self.queue_free()
