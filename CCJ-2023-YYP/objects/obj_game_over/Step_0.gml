/// 
event_inherited();

if (input_check_pressed("confirm"))
{
	input_consume("confirm");
	game_restart();
}