/// @desc Player: Create
event_inherited();

//Deleting extra copies of the player.
if (instance_number(obj_player) > 1)
{
	instance_destroy();
	exit;
}

//Player Stats
move_speed = 4;

//Pathfinding
gox = x;
goy = y;
path = path_add();