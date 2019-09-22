extends Node2D

onready var Player1 = get_node("Players/Player1")  
onready var Player2 = get_node("Players/Player2")
onready var Item = preload("res://Item.tscn")

onready var Barrel01 = get_node("Barrels/Barrel01")
onready var Barrel02 = get_node("Barrels/Barrel02")
onready var iT = get_node("Items/ItemTest")

var items = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#barrelCheckLoop()
	
	#checkAttachLoop()	
	#itemAttachedLoop()
	pass

#func checkAttachLoop():
#	if iT.entered:
#		var curPlayer = iT.enteredPlayer
#		if curPlayer == Player1.name:
#			Player1.getItem(iT)
#		elif curPlayer == Player2.name:
#			Player2.getItem(iT)		
		
	
#func barrelCheckLoop():
#	if Barrel01.entered:
#		var currentPlayer = Barrel01.enteredPlayer
#		if currentPlayer == Player1.name:
#			if Player1.hasItem:
#				spawnItem(Player1.position)
#		elif currentPlayer == Player2.name:
#			if Player2.hasItem:
#				spawnItem(Player2.position)
#	elif Barrel02.entered:
#		var currentPlayer = Barrel02.enteredPlayer
#		if currentPlayer == Player1.name:
#			if Player1.hasItem:
#				spawnItem(Player1.position)
#		elif currentPlayer == Player2.name:
#			if Player2.hasItem:
#				spawnItem(Player2.position)
#
#func spawnItem(pos):
#	var it = Item.instance()
#	it.position = pos
#	get_node("Items").add_child(it)
#


