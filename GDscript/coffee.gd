extends Sprite

export var countdownMax = 1000
var countdown = 0
var attn = false
var colliding = false
var toExplode = 1000
var speed = 1
var active = false

func _ready():
	get_node("oh").hide()
	countdown = countdownMax
	get_node("collisionSpace").connect("body_enter",self,"_on_body_enter")
	get_node("collisionSpace").connect("body_exit",self,"_on_body_exit")
	set_process(true)
	set_process_input(true)

func _process(delta):
	if active && !attn:
		countdown -= 1*speed
	if active && attn: 
		toExplode -= 1*speed
	if active && !attn && countdown <= 0:
		get_node("oh").show()
		attn = true
		toExplode = 1000
		print("Brewed!")
	if toExplode <= 0:
		get_parent().get_tree().reload_current_scene()

func _input(event):
	if colliding && event.is_action_pressed("ui_accept"):
		if !active:
			active = true
			print("Brewing!")
		else:
			attn = false
			countdown = countdownMax
			get_node("oh").hide()
			global.speed = 2
			active = false

func _on_body_enter( body ):
	if body.is_in_group("player"):
		colliding = true
func _on_body_exit( body ):
	if body.is_in_group("player"):
		colliding = false
