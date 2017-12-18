extends KinematicBody2D

const WALK_SPEED = 500

var velocity = Vector2()

func _ready():
	global.goblin = self
	global.speed = 1
	set_process(true)

func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED*global.speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED*global.speed
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -WALK_SPEED*global.speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = WALK_SPEED*global.speed
	else:
		velocity.y = 0
	
	var motion = velocity * delta
	motion = move(motion)
	
	if (is_colliding()):
        var n = get_collision_normal()
        motion = n.slide(motion)
        velocity = n.slide(velocity)
        move(motion)

