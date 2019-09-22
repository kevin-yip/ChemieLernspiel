extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var attached 
var currentPlayer 
var player
var entered
var enteredPlayer


var timer 
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.set_wait_time(1)
	self.add_child(timer)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if attached:
		attached_Loop()
	else:
		pick_up_Item()
	

func pick_up_Item():
	if entered:
		var curPlayer = get_node("../../Players/%s" % enteredPlayer)
		if curPlayer.hasItem():
			attached = true
			currentPlayer = enteredPlayer
			curPlayer.currentItem = self.name
			timer.start()
			yield(timer, "timeout")
		
			
func attached_Loop():
	var curPlayer = get_node("../../Players/%s" % currentPlayer)
	print(curPlayer.currentItem)
	if Input.is_action_just_released('item_%s' % curPlayer.id) and curPlayer.currentItem != null:
		attached = false
		currentPlayer = null
		curPlayer.currentItem = null
		timer.start()
		yield(timer, "timeout")
	else: 
		curPlayer.getPosition2D()
		position = curPlayer.position2D

func setPosition(pos):
	position = pos

func _on_Item_body_entered(body):
	if "Player" in body.name:
		entered = true
		enteredPlayer = body.name


func _on_Item_body_exited(body):
	if "Player" in body.name:
		entered = false
		enteredPlayer = null	
