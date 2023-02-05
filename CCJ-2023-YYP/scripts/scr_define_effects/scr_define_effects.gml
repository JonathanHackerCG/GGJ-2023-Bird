/// @desc File containing the functions that can be used as card effects and targets.

//Targeting functions.
#region target_self();
/// @func target_self
/// @desc Targets the player!
function target_self()
{
	CONTROL.targets = [PLAYER];
	return true;
}
#endregion

//Attacking functions.
#region effect_damage(amount);
/// @func effect_damage();
/// @desc Deal a set amount of damage.
/// @arg	amount
function effect_damage(_amount)
{
	_with_targets(function(_amount)
	{
		take_damage(_amount);
	}, [_amount]);
	return true;
}
#endregion
#region effect_damage_range();
/// @func effect_damage_range(minimum, maximum);
/// @desc Deal a random amount of damage in a range.
/// @arg	minimum
/// @arg maximum
function effect_damage_range(_minimum, _maximum)
{
	_with_targets(function(_minimum, _maximum)
	{
		var _amount = irandom_range(_minimum, _maximum);
		take_damage(_amount);
	}, [_minimum, _maximum]);
	return true;
}
#endregion

//Damage handling.
#region take_damage(amount);
/// @func take_damage
/// @arg	amount
function take_damage(_amount)
{
	hp -= _amount;
	if (hp <= 0)
	{
		show_debug_message("DEAD!");
	}
}
#endregion

//Internal usage (don't touch).
#region _with_targets(function, parameters);
/// @func _with_targets
/// @arg	_function
function _with_targets(_function, _parameters)
{
	var _size = array_length(CONTROL.targets);
	for (var i = 0; i < _size; i++)
	{
		with (CONTROL.targets[i])
		{
			function_ext_array(method(id, _function), _parameters);
		}
	}
}
#endregion