/// @desc CONTROL: Draw End
event_inherited();

var text = "Click - Move or Play Card, Space - End Turn\nF1 - Mute Audio, F2 Mute Music, F11 Fullscreen";
draw_text_set(SCREEN_W / 2, 36, text, fnt_card_name, fa_center, fa_center, c_black);
draw_text_set((SCREEN_W / 2) - 2, 34, text, fnt_card_name, fa_center, fa_center, c_white);

if (!instance_exists(PLAYER)) { exit; }

draw_set_color(c_white);
draw_set_font(fnt_card_name);
draw_set_halign(fa_left);
draw_text(16, 96, "HP: " + string(PLAYER.hp) + "/" + string(PLAYER.hp_max) + " <" + string(PLAYER.armor) + ">");
draw_text(16, 48, "Sap: " + string(PLAYER.sap) + "/" + string(PLAYER.sap_max));

//Drawing Cards
if (in_combat)
{
	player_deck.draw_input();
}
else
{
	////Debugging
	//draw_set_alpha(0.25);
	//mp_grid_draw(collision);
	//draw_set_alpha(1.00);
}