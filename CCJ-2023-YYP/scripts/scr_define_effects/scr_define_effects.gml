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
#region target_enemy_strongest();
/// @func target_enemy_strongest():
/// @desc Targets the enemy with the highest HP.
function target_enemy_strongest()
{
	var _temp = [];
	array_copy(_temp, 0, CONTROL.enemies, 0, instance_number(par_enemy));
	_temp = array_shuffle(_temp);
	
	var _hp = -1;
	var _choice = noone;
	var _size = array_length(_temp);
	for (var i = 0; i < _size; i++)
	{
		var _enemy = _temp[i];
		if (_hp == -1 || _enemy.hp > _hp)
		{
			_choice = _enemy;
			_hp = _choice.hp;
		}
	}
	CONTROL.targets = [_choice];
	return true;
}
#endregion
#region target_enemy_weakest();
/// @func target_enemy_weakest():
/// @desc Targets the enemy with the lowest HP.
function target_enemy_weakest()
{
	var _temp = [];
	array_copy(_temp, 0, CONTROL.enemies, 0, instance_number(par_enemy));
	_temp = array_shuffle(_temp);
	
	var _hp = -1;
	var _choice = noone;
	var _size = array_length(_temp);
	for (var i = 0; i < _size; i++)
	{
		var _enemy = _temp[i];
		if (_hp == -1 || _enemy.hp < _hp)
		{
			_choice = _enemy;
			_hp = _choice.hp;
		}
	}
	CONTROL.targets = [_choice];
	return true;
}
#endregion
#region target_enemy_random(number);
/// @func target_enemy_random():
/// @desc Targets a random number of enemies.
/// @arg	number
function target_enemy_random(_number)
{
	CONTROL.targets = [];
	var _temp = [];
	array_copy(_temp, 0, CONTROL.enemies, 0, instance_number(par_enemy));
	_temp = array_shuffle(_temp);
	
	repeat(_number)
	{
		var _inst = array_pop(_temp);
		array_push(CONTROL.targets, _inst);
	}
	return true;
}
#endregion
#region target_enemy_random_range(min, max);
/// @func target_enemy_random_range():
/// @desc Targets a random range number of enemies.
/// @arg	minimum
/// @arg	maximum
function target_enemy_random_range(_minimum, _maximum)
{
	var _number = irandom_range(_minimum, _maximum);
	return target_enemy_random(_number);
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
#region effect_damage_range(min, max);
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
#region effect_heal(amount);
/// @func effect_heal();
/// @desc Deal a set amount of heal.
/// @arg	amount
function effect_heal(_amount)
{
	_with_targets(function(_amount)
	{
		heal(_amount);
	}, [_amount]);
	return true;
}
#endregion
#region effect_heal_range(min, max);
/// @func effect_heal_range(minimum, maximum);
/// @desc Deal a random amount of heal in a range.
/// @arg	minimum
/// @arg maximum
function effect_heal_range(_minimum, _maximum)
{
	_with_targets(function(_minimum, _maximum)
	{
		var _amount = irandom_range(_minimum, _maximum);
		heal(_amount);
	}, [_minimum, _maximum]);
	return true;
}
#endregion
#region effect_sap(amount);
/// @func effect_sap();
/// @desc Give a set amount of sap.
/// @arg	amount
function effect_sap(_amount)
{
	_with_targets(function(_amount)
	{
		gain_sap(_amount);
	}, [_amount]);
	return true;
}
#endregion
#region effect_sap_range(min, max);
/// @func effect_sap_range(minimum, maximum);
/// @desc Gain a random amount of sap in a range.
/// @arg	minimum
/// @arg maximum
function effect_sap_range(_minimum, _maximum)
{
	_with_targets(function(_minimum, _maximum)
	{
		var _amount = irandom_range(_minimum, _maximum);
		gain_sap(_amount);
	}, [_minimum, _maximum]);
	return true;
}
#endregion
#region effect_draw(amount);
/// @func effect_draw();
/// @desc Draw cards.
/// @arg	amount
function effect_draw(_amount)
{
	_with_targets(function(_amount)
	{
		CONTROL.player_deck.draw(_amount);
	}, [_amount]);
	return true;
}
#endregion
#region effect_draw_range(min, max);
/// @func effect_draw_range(minimum, maximum);
/// @desc Draw a random number of cards.
/// @arg	minimum
/// @arg maximum
function effect_draw_range(_minimum, _maximum)
{
	_with_targets(function(_minimum, _maximum)
	{
		var _amount = irandom_range(_minimum, _maximum);
		CONTROL.player_deck.draw(_amount);
	}, [_minimum, _maximum]);
	return true;
}
#endregion

//Enemy attacking functions.
#region attack_damage(_amount);
/// @func attack_damage
/// @desc Deals damage to the player.
/// @arg	amount
function attack_damage(_amount)
{
	target_self();
	effect_damage(_amount);
	return true;
}
#endregion
#region attack_heal_self(_amount);
/// @func attack_heal_self
/// @desc Heals the enemy for an amount.
/// @arg	amount
function attack_heal_self(_amount)
{
	CONTROL.targets = [id];
	effect_heal(_amount);
	return true;
}
#endregion
#region attack_heal_ally(_amount)
/// @func attack_heal_ally
/// @desc Heals a random ally for an amount.
/// @arg	amount
function attack_heal_ally(_amount)
{
	CONTROL.targets = [instance_find(par_enemy, irandom(instance_number(par_enemy) - 1))];
	effect_heal(_amount);
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
		if (object_index == PLAYER)
		{
			hp = hp_max;
		}
		else
		{
			var myid = id;
			with (CONTROL)
			{
				var _size = array_length(enemies);
				for (var i = 0; i < _size; i++)
				{
					if (enemies[i] == myid)
					{
						array_delete(enemies, i, 1);
						i = _size;
					}
				}
			}
			instance_destroy();
		}
	}
}
#endregion
#region heal(amount);
/// @func heal
/// @arg	amount
function heal(_amount)
{
	hp += _amount;
	hp = clamp(hp, 0, hp_max);
}
#endregion
#region gain_sap(amount);
/// @func gain_sap
/// @arg	amount
function gain_sap(_amount)
{
	sap += _amount;
	sap = clamp(sap, 0, sap_max);
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