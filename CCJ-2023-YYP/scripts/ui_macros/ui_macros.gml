#macro FONT_NAME "fnt_card_name"
#macro FONT_NUMBER "fnt_card_number"
#macro FONT_DESCRIPTION "fnt_card_description"

#macro HEALTHBAR_Y_OFFSET 8
#macro INTENT_Y_OFFSET 40

function draw_player_healthbar()
{
	var xx = UI.health_x;
	var yy = UI.health_y;
	var hp_scale = PLAYER.hp / PLAYER.hp_max;
	draw_sprite(spr_ui_health, 1, xx, yy);
	draw_sprite_ext(spr_ui_health, 2, xx, yy, 1, hp_scale, 0, c_white, 1.0);
	draw_sprite(spr_ui_health, 3, xx, yy);
	draw_text_scribble(xx - 4, yy - 78, $"[fnt_card_name_outline][fa_center][fa_top][c_aqua]<{string(PLAYER.armor)}>[/c]\n{string(PLAYER.hp)}");
}