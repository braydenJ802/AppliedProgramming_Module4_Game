#script: block.gd
extends KinematicBody2D

var velocity = Vector2.ZERO

const GRAVITY = 50 #in pixels
const JUMP = 1000   #start speed px/s

#const SPEED = 20

func _physics_process(_delta):
	
#	velocity.x = 0
##	#move left
#	if Input.is_action_just_pressed("ui_left"):
#		velocity.x = -SPEED
##	#move right
#	elif Input.is_action_just_pressed("ui_right"):
#		velocity.x = SPEED
	
	#apply gravity
	velocity.y += GRAVITY
	
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)
	#jump
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		jump()
	
	

func jump():
	# add 1 to score for every jump done
	add_to_score()
	velocity.y = -JUMP
	
func add_to_score():
	Server.Score += 1


