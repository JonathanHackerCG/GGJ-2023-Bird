/// @desc CONTROL: Draw End
event_inherited();

draw_set_color(c_black);
draw_set_font(fnt_card_name);
draw_set_halign(fa_left);
draw_text(16, SCREEN_H - 96, "HP: " + string(PLAYER.hp) + "/" + string(PLAYER.hp_max));
draw_text(16, SCREEN_H - 48, "Sap: " + string(PLAYER.sap) + "/" + string(PLAYER.sap_max));

//Drawing Cards
if (in_combat)
{
	player_deck.draw_input();
}
else
{
	//Debugging
	draw_set_alpha(0.25);
	mp_grid_draw(collision);
	draw_set_alpha(1.00);
}