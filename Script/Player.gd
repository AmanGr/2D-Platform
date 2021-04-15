extends KinematicBody2D

const SPEED = 600
const GRAVITY = 3600
const UP = Vector2(0,-1)
const JUMP_SPEED = -1500
const JUMP_BOOST = 2


var motion = Vector2()
export var world_limit = 4000


func _physics_process(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

#func _process(delta):
#	update_animation(motion)

#func update_animation(motion):
	#$AnimatedSprite.update(motion)

func fall(delta):
	if is_on_floor():
		motion.y = 0
	else:
	    motion.y += GRAVITY * delta
	
	if position.y > world_limit:
		Global.GameState.end_game()

func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = true
	else:
		motion.x = 0
		$AnimatedSprite.play("Idle")

func jump():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		motion.y = JUMP_SPEED
		$AnimatedSprite.play("Jump")
		Global.jump_sfx.play()

#func boost():
	#motion.y = JUMP_SPEED * JUMP_BOOST

func hurt():
	$AnimatedSprite.play("sss")
