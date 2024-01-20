/// @desc CONTROL: Draw End
event_inherited();

if (!show_ui) { exit; }

var text = "[fnt_card_name_outline][fa_center][fa_middle]Click [c_ltgray]Move or Play Card[/c] ~ Space [c_ltgray]End Turn[/c]\nF1 [c_ltgray]Mute Audio[/c] ~ F2 [c_ltgray]Mute Music[/c] ~ F11 [c_ltgray]Fullscreen[/c]";
draw_text_scribble(SCREEN_W / 2, 64, text);

if (!instance_exists(PLAYER)) { exit; }

//Drawing Cards
if (in_combat)
{
	player_deck.draw_input();
}
else
{
	draw_player_healthbar();
	////Debugging
	//draw_set_alpha(0.25);
	//mp_grid_draw(collision);
	//draw_set_alpha(1.00);
}