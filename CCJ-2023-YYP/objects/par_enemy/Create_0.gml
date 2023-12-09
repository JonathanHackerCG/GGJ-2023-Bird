/// @desc Enemy: Create
event_inherited();

savekey = SAVE.make_key(id);
if (SAVE.check(savekey))
{
	instance_destroy();
	exit;
}

hp = 1;
hp_max = hp;
armor = 0;
attack_options = [];
attack_parameters = [];
attack_intents = [];
attack_index = -1;

healthbar_x = x - sprite_get_xoffset(sprite_index) + (sprite_get_width(sprite_index) / 2);
healthbar_y = y - sprite_get_yoffset(sprite_index) - HEALTHBAR_Y_OFFSET;

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