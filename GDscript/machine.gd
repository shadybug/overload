extends Sprite

export var countdownMax = 1000
export var sense = ""
var countdown = 0
var attn = false
var colliding = false
var toExplode = 1000
var speed = 1

func _ready():
	get_node("oh").hide()
	countdown = countdownMax
	get_node("ProgressBar").set_max(countdownMax)
	get_node("collisionSpace").connect("body_enter",self,"_on_body_enter")
	get_node("collisionSpace").connect("body_exit",self,"_on_body_exit")
	set_process(true)

func _process(delta):
	if sense == "light":
		speed = global.lightMod
	elif sense == "motion":
		speed = global.motionMod
	else:
		speed = global.soundMod
	
	get_node("ProgressBar").set_value(countdownMax - countdown)
	if attn && colliding:
		if  Input.is_action_pressed("ui_accept"):
			attn = false
			countdown = countdownMax
			get_node("oh").hide()
			get_node("ProgressBar").show()
			global.screen.set_machine(self,randi()%3)
	if attn:
		toExplode -= 1*speed
	if !attn:
		countdown -= 1*speed
	if !attn && countdown <= 0:
		get_node("oh").show()
		get_node("ProgressBar").hide()
		attn = true
		toExplode = 1000
	if toExplode <= 0:
		get_parent().get_tree().reload_current_scene()

func _on_body_enter( body ):
	if body.is_in_group("player"):
		colliding = true
func _on_body_exit( body ):
	if body.is_in_group("player"):
		colliding = false
