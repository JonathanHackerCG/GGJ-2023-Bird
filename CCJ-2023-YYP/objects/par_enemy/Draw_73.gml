/// @desc Drawing During Combat
event_inherited();

if (CONTROL.in_combat)
{
	draw_healthbar(x - 64, y - 8, x + 64, y, (hp / hp_max) * 100, c_black, c_red, c_red, 0, true, true);
	if (attack_index != -1)
	{
		draw_set_halign(fa_center);
		draw_text(x, y - 32, string(attack_intents[attack_index]));
		draw_set_halign(fa_left);
	}
}