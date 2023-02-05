/// @desc Player: Create
event_inherited();

//Deleting extra copies of the player.
if (instance_number(PLAYER) > 1)
{
	instance_destroy();
	exit;
}

//Player Stats
move_speed = 4;
hp = 100;
hp_max = 100;
sap = 3;
sap_max = 9;

//Pathfinding
gox = x;
goy = y;
path = path_add();