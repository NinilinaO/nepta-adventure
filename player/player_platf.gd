extends CharacterBody2D
@onready var sprite = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer
@onready var actionable_finder: Area2D = $ActionableFinder
const  GRAVITY = 1000
const  SPEED = 300
const JUMP = -350
const JUMP_H = 100
var can_coyote_jump = false

enum State { idle, run, jump }

var current_state

func _ready():
	current_state = State.idle


func _physics_process(delta):
	player_falling(delta)
	player_idle(delta)
	player_run(delta)
	player_jump(delta)
	var actionables = actionable_finder.get_overlapping_areas()
	if actionables.size() > 0:
		actionables[0].action()
		return
	
	var was_on_floor = is_on_floor()
	move_and_slide()
	if was_on_floor and !is_on_floor() and velocity.y >= 0:
		can_coyote_jump = true
		coyote_timer.start()
	
	player_animation()


func _on_coyote_timer_timeout():
	can_coyote_jump = false

func player_falling(delta):
	if !is_on_floor() and (can_coyote_jump == false):
		velocity.y += GRAVITY * delta


func player_idle(_delta):
	if is_on_floor():
		current_state = State.idle

func player_run(_delta):
	var direction = Input.get_axis("run_left", "run_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(direction, 0, SPEED)
	
	if direction != 0:
		current_state = State.run
		sprite.flip_h = false if direction > 0 else true

func player_jump(delta):
	if Input.is_action_pressed("jump"):
		if is_on_floor() or can_coyote_jump:
			velocity.y = JUMP
			current_state = State.jump
			if can_coyote_jump:
				can_coyote_jump = false
	if !is_on_floor() and current_state == State.jump:
		var direction = Input.get_axis("run_left", "run_right")
		velocity.x += direction * JUMP_H * delta

func player_animation():
	if current_state == State.idle:
		sprite.play("idle")
	elif current_state == State.run and is_on_floor():
		sprite.play("run")
	elif current_state == State.jump:
		sprite.play("jump")
