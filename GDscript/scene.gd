extends CanvasModulate

func _ready():
	set_process(true)

func _process(delta):
	global.chaos = (global.light + global.sound + global.motion) / 3
	global.lightMod = global.light / 50
	global.soundMod = global.sound / 50
	global.motionMod = global.motion / 50
