/// @desc Drawing During Combat
event_inherited();

if (CONTROL.in_combat)
{
	draw_healthbar(healthbar_x - 64, healthbar_y - 8, healthbar_x + 64, healthbar_y, (hp / hp_max) * 100, c_black, c_red, c_red, 0, true, true);
	if (attack_index != -1)
	{
		draw_text_set(healthbar_x, healthbar_y - INTENT_Y_OFFSET, string(attack_intents[attack_index]), fnt_card_description, fa_center, fa_center, c_black);
	}
}