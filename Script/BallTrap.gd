extends Area2D

func _ready():
	$AnimationPlayer.play("Idle")

func _on_BallTrap_body_entered(body):
	Global.GameState.hurt()


func _on_Area2D_body_entered(body):
	Global.GameState.hurt()
