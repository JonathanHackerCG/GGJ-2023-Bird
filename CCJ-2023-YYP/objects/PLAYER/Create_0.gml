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
hp = 60;
hp_max = 60;
sap = 3;
sap_max = 9;
armor = 0;

//Pathfinding
gox = x;
goy = y;
path = path_add();

#region build_sprite_array(key, default);
/// @func build_sprite_array
/// @desc Creates an array of four sprites by derferencing a key.
/// @arg	{String} key
/// @arg	{Asset.Sprite} default
function build_sprite_array(_key, _default)
{
	var _array = [];
	var _angle = 0;
	repeat(4)
	{
		_array[_angle / 90] = _default;
		var _sprite = asset_get_index(_key + string(_angle));
		if (_sprite != -1)
		{
			_array[_angle / 90] = _sprite;
		}
		_angle += 90;
	}
	return _array;
}
#endregion

//Sprite variables.
sprite_dir = 2;
sprites_idle = build_sprite_array("spr_player_idle", spr_player_idle270);
sprites_walk = build_sprite_array("spr_player_walk", spr_player_walk270);