extends CharacterBody2D

const RIGHT = 'D'
const LEFT = 'A'
const DOWN = 'S'
const UP = 'W'


var speed = 90
var last_dir = RIGHT


func _physics_process(delta):
	walk_input(delta)


func walk_input(delta):
	
	velocity.y = 0
	velocity.x = 0
	
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed		
		
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
		
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
		
	if velocity.y and velocity.x:
		velocity.y*=0.7
		velocity.x*=0.7
	
	walk_animation(velocity.x, velocity.y)
	move_and_slide()


func walk_animation(x,y):
	var animation = $AnimatedSprite2D
	
	if velocity.x or velocity.y:
		
		last_dir = ''
		
		if y>0: 
			last_dir += DOWN
		elif y<0:
			last_dir += UP 
			
		if x>0:
			last_dir += RIGHT
		elif x<0:
			last_dir += LEFT
			
		animation.play("Walking-" + last_dir)
		
	else:
		animation.play("Idle-" + last_dir)
			
