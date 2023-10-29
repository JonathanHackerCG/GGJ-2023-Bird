/// @desc Drawing During Combat
event_inherited();

if (CONTROL.in_combat)
{
	draw_healthbar(healthbar_x - 64, healthbar_y - 8, healthbar_x + 64, healthbar_y, (hp / hp_max) * 100, c_black, c_red, c_red, 0, true, true);
	if (armor > 0)
	{
		draw_text_set(healthbar_x + 72, healthbar_y, "<" + string(armor) + ">", fnt_card_description, fa_left, fa_center, c_white);
	}
	if (attack_index != -1)
	{
		//Draw intention.
		draw_text_set(healthbar_x, healthbar_y - INTENT_Y_OFFSET, string(attack_intents[attack_index]), fnt_card_description, fa_center, fa_center, c_black);
	}
	if (CONTROL.selected_enemy == id)
	{
		//Draw selection "arrow" (janky placeholder).
		draw_text_set(healthbar_x, healthbar_y - INTENT_Y_OFFSET - 20, "\\/", fnt_card_name, fa_center, fa_center, c_yellow);
	}
}