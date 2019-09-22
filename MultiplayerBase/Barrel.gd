extends Area2D

onready var item = preload("res://Item.tscn")
var enteredPlayer
onready var entered = false


func _process(delta):
	_Barrel_give_Item()
		

func _Barrel_give_Item():
	if entered: 
		if "Player" in enteredPlayer:
			var curPlayer = get_node("../../Players/%s" % enteredPlayer)
			if curPlayer.hasItem():
				spawnItem(curPlayer.position, curPlayer)
			
func spawnItem(pos, curPlayer):
	var it = item.instance()
	it.position = pos
	it.attached = true
	it.currentPlayer = curPlayer.name
	curPlayer.currentItem = it.name
	get_node("../../Items").add_child(it)
	
			

func _on_Barrel_body_entered(body):
	#if body.name == "Player2" or body.name =="Player1":
	if "Player" in body.name:
		entered = true
		enteredPlayer = body.name
	
func _on_Barrel_body_exited(body):
	#if body.name == "Player2" or body.name =="Player1":
	if "Player" in body.name:
		entered = false
		enteredPlayer = null
