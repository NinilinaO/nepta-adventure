extends ParallaxBackground

var speed = 150


func _process(delta):
	scroll_offset.x -= speed*delta
