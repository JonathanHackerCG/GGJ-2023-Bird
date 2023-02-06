/// @desc 
event_inherited();

if (input_check_pressed("confirm"))
{
	input_consume("confirm");
	room_goto(rm_start);
}