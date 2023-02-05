/// @desc Player: Step
event_inherited();

if (CONTROL.in_combat) { exit; }

//Movement/Pathfinding
if (input_check_pressed("move"))
{
	gox = clamp(mouse_x, CELLSIZE, room_width - CELLSIZE);
	goy = clamp(mouse_y, CELLSIZE, room_height - CELLSIZE);
	var _dir = point_direction(gox, goy, x, y);
	while (mp_grid_get_cell(CONTROL.collision, gox / CELLSIZE, goy / CELLSIZE) == -1)
	{
		//Correcting path when input is out of bounds.
		gox += lengthdir_x(CELLSIZE, _dir);
		goy += lengthdir_y(CELLSIZE, _dir);
	}
	mp_grid_path(CONTROL.collision, path, x, y, gox, goy, true);
	path_start(path, move_speed, path_action_stop, true);
}

//Room transitions.
var _off = CELLSIZE * 1.5;
if (x <= _off || y <= _off || x >= SCREEN_W - _off || y >= SCREEN_H - _off)
{
	var _inst = instance_position(x, y, obj_transition);
	if (instance_exists(_inst) && _inst.target_room != noone)
	{
		_off = _off * 2;
		switch (_inst.location)
		{
			case "top":			{ y = SCREEN_H - _off;	} break;
			case "bottom":	{ y = _off;							} break;
			case "left":		{ x = SCREEN_W - _off;	} break;
			case "right":		{ x = _off;							} break;
			default: break;
		}
		path_end();
		room_goto(_inst.target_room);
	}
}