/// 
event_inherited();

if (input_check_pressed("confirm"))
{
	AUDIO.play("snd_shuffle");
	input_consume("confirm");
	instance_destroy();
}