extends TextureFrame

var machine
var num

func _ready():
	set_process(true)
	global.screen = self
	hide()

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		release_focus()

func set_machine(caller, input):
	machine = caller
	num = input
	if num == 0:
		get_node("msg").set_text("confirm!")
	elif num == 1:
		get_node("msg").set_text("deny!")
	else:
		get_node("msg").set_text("restart!")
	get_node("speed").set_text(str(machine.speed))
	grab_focus()
	if global.goblin.get_pos().y > 900:
		set_pos(Vector2(384,640))
	else:
		set_pos(Vector2(384,128))
	show()

func bad_pick():
	release_focus()
	hide()

func good_pick():
	release_focus()
	hide()

func _on_confirm_pressed():
	if num == 0:
		good_pick()
	else:
		bad_pick()

func _on_deny_pressed():
	if num == 1:
		good_pick()
	else:
		bad_pick()

func _on_restart_pressed():
	if num == 2:
		good_pick()
	else:
		bad_pick()

func _on_incr_pressed():
	machine.speed += 1

func _on_decr_pressed():
	machine.speed += 1