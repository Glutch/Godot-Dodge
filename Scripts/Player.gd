extends Area2D

export (int) var SPEED
var velocity = Vector2()
var screenSize

func _ready():
	screenSize = get_viewport_rect().size
	
func _process(delta):
	move(delta)
	
func move(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.flip_v = true
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite.flip_v = false
		velocity.y -= 1
	if velocity.length() > 0:
		$AnimatedSprite.play()
		velocity = velocity.normalized() * SPEED
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y)