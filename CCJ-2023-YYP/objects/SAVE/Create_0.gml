/// SAVE: Create

data = ds_map_create();
#region make_key(inst);
/// @func make_key(inst):
/// @desc Generates a unique key based on instance id, x/y, room.
/// @arg	{Id.Instance} inst
/// @returns {String}
function make_key(_inst)
{
	return $"{_inst.x}{_inst.y}{room}";
}
#endregion
#region check(key);
/// @func check(key);
/// @desc Returns the value of a savekey.
/// @arg	{String} key
/// @returns {Any}
function check(_key)
{
	return data[? _key];
}
#endregion
#region set(key, value);
/// @func set(key, value);
/// @desc Sets the value of a savekey.
function set(_key, _value)
{
	data[? _key] = _value;
}
#endregion