extends KinematicBody2D

export var id = 0
export var speed = 250

onready var item = preload("res://Item.tscn")
onready var iT = get_node("../../Items/ItemTest")

var currentItem

var velocity = Vector2()
onready var hasItem = false

var position2D
var t

func _ready():
	hasItem = false   
	
	
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right_%s' % id):
		velocity.x += 1
	if Input.is_action_pressed('left_%s' % id):
		velocity.x += -1
	if Input.is_action_pressed('up_%s' % id):
		velocity.y += -1
	if Input.is_action_pressed('down_%s' % id):
		velocity.y += 1
	velocity = velocity.normalized() * speed
	
#	if Input.is_action_pressed('item_%s' % id) and hasItem == false:
#		hasItem = true
#	elif Input.is_action_pressed('item_%s' % id) and hasItem == true:
#		hasItem = false
#	else:
#		hasItem = false

func hasItem():
	if Input.is_action_just_released('item_%s' % id) and currentItem == null:
		return true;
	else:
		return false;

func getItem(curItem):
	if Input.is_action_just_released('item_%s' % id) and iT.attached == false and currentItem == null:
		currentItem = iT
		iT.attached = true
		iT.currentPlayer = self.name
		t.start()
		yield(t, "timeout")
	elif Input.is_action_just_released('item_%s' % id) and iT.attached == true and currentItem != null:
		print(iT.attached)
		currentItem = null
		iT.attached = false
		iT.currentPlayer = null
		


func removeItem(curItem):
	pass
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func getPosition2D():
	position2D = $Position2D.global_position
	
	