/// @desc 
event_inherited();

if (input_check_pressed("confirm") && !DEBUG_USING_MOUSE)
{
	input_consume("confirm");
	room_goto(rm_story);
}