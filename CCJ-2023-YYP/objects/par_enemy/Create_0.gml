/// @desc Enemy: Create
event_inherited();

hp = 1;
hp_max = hp;
attack_options = [];
attack_parameters = [];
attack_intents = [];
attack_index = -1;

function choose_attack()
{
	attack_index = irandom(array_length(attack_options) - 1);
	return true;
}

function attack()
{
	function_ext_array(attack_options[attack_index], attack_parameters[attack_index]);
	attack_index = -1;
	return true;
}