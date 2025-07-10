extends CharacterBody2D

const RIGHT = 'R'
const LEFT = 'L'
const DOWN = 'D'
const UP = 'U'


var speed = 100
var last_dir = RIGHT


func _physics_process(delta):
	walk_input(delta)


func walk_input(delta):
	
	velocity.y = 0
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed		
		last_dir = RIGHT
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		last_dir = LEFT
		
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		last_dir = DOWN
		
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		last_dir = UP
	
	walk_animation(velocity.y + velocity.x)
	move_and_slide()


func walk_animation(speed):
	var animation = $AnimatedSprite2D
	
	if speed:
		animation.play("Walking-" + last_dir)
	else:
		animation.play("Idle-" + last_dir)	

