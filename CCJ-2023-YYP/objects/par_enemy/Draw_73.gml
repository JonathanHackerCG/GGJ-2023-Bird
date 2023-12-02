/// @desc Drawing During Combat
event_inherited();

if (CONTROL.in_combat)
{
	draw_reset();
	draw_healthbar(healthbar_x - 64, healthbar_y - 8, healthbar_x + 64, healthbar_y, (hp / hp_max) * 100, c_black, c_red, c_red, 0, true, true);
	if (armor > 0)
	{
		draw_text_scribble(healthbar_x + 72, healthbar_y - 16, $"[fa_left][fnt_card_description_outline][c_aqua]<{armor}>");
	}
	if (attack_index != -1)
	{
		//Draw intention.
		draw_text_scribble(healthbar_x, healthbar_y - INTENT_Y_OFFSET, $"[fa_center][fnt_card_description_outline]({attack_intents[attack_index]})");
	}
	if (CONTROL.selected_enemy == id)
	{
		//Draw selection "arrow" (janky placeholder).
		draw_text_set(healthbar_x, healthbar_y - INTENT_Y_OFFSET - 20, "\\/", fnt_card_name, fa_center, fa_center, c_yellow);
	}
	draw_reset();
}