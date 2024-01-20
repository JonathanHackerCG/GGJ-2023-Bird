/// @desc Player: Step
event_inherited();

if (keyboard_check_pressed(vk_escape)) { game_end(); }

if (CONTROL.in_combat) { exit; }
if (instance_exists(obj_card_preview)) { exit; }

//Movement/Pathfinding
if (input_check_pressed("move") && !DEBUG_USING_MOUSE)
{
	gox = clamp(mouse_x, CELLSIZE, room_width - CELLSIZE);
	goy = clamp(mouse_y, CELLSIZE, room_height - CELLSIZE);
	var _dir = point_direction(gox, goy, x, y);
	while (mp_grid_get_cell(CONTROL.collision, gox / CELLSIZE, goy / CELLSIZE) == -1
		&& point_in_rectangle(gox, goy, 0, 0, room_width, room_height))
	{
		//Correcting path when input is out of bounds.
		gox += lengthdir_x(CELLSIZE / 2, _dir);
		goy += lengthdir_y(CELLSIZE / 2, _dir);
	}
	if (!mp_grid_path(CONTROL.collision, path, x, y, gox, goy, true))
	{
		//Fallback pathfinding (could not find a path).
		gox = mouse_x;
		goy = mouse_y;
		mp_linear_path(path, gox, goy, CELLSIZE / 2, false);
	}
	path_start(path, move_speed, path_action_stop, true);
}

//Animations
var _dir = point_direction(x, y, gox, goy);
var _dis = point_distance(xprevious, yprevious, x, y);

//Movement/Sprite Logic
if (path_index != -1)
{
	sprite_dir = ((_dir + 45) / 90) % 4;
	sprite_index = sprites_walk[sprite_dir];
}
else
{
	sprite_index = sprites_idle[sprite_dir];
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