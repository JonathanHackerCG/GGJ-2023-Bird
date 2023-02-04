/// @desc Player: Step
event_inherited();

if (input_check_pressed("move"))
{
	gox = clamp(mouse_x, CELLSIZE, room_width - CELLSIZE);
	goy = clamp(mouse_y, CELLSIZE, room_height - CELLSIZE);
	var _dir = point_direction(gox, goy, x, y);
	while (mp_grid_get_cell(CONTROL.collision, gox / CELLSIZE, goy / CELLSIZE) == -1)
	{
		gox += lengthdir_x(CELLSIZE, _dir);
		goy += lengthdir_y(CELLSIZE, _dir);
	}
	mp_grid_path(CONTROL.collision, path, x, y, gox, goy, true);
	path_start(path, move_speed, path_action_stop, true);
}