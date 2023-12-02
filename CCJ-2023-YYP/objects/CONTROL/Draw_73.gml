/// @desc CONTROL: Draw End
event_inherited();

var text = "[fnt_card_name_outline][fa_center][fa_middle]Click [c_ltgray]Move or Play Card[/c] ~ Space [c_ltgray]End Turn[/c]\nF1 [c_ltgray]Mute Audio[/c] ~ F2 [c_ltgray]Mute Music[/c] ~ F11 [c_ltgray]Fullscreen[/c]";
draw_text_scribble(SCREEN_W / 2, 64, text);

if (!instance_exists(PLAYER)) { exit; }

draw_set_color(c_white);
draw_set_font(fnt_card_name);
draw_set_halign(fa_left);
draw_text_scribble(16, 96, $"[fnt_card_name_outline]HP: {PLAYER.hp}/{PLAYER.hp_max} [c_aqua]<{PLAYER.armor}>[]");
draw_text_scribble(16, 48, $"[fnt_card_name_outline]Sap: {PLAYER.sap}/{PLAYER.sap_max}");

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