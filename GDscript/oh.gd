extends Sprite

var MAX
var MIN

var incr = true
var pos

func _ready():
	MAX = (get_pos().y - 16)
	MIN = (get_pos().y + 16)
	set_process(true)

func _process(delta):
	pos = get_pos()
	if incr:
		pos.y = pos.y - 1
		if pos.y <= MAX:
			incr = false
	else:
		pos.y = pos.y + 1
		if pos.y >= MIN:
			incr = true
	
	set_pos(pos)
