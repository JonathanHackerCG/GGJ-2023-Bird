/// @desc CONTROL: Draw End
event_inherited();

draw_text(16, 16, string(PLAYER.hp) + "/" + string(PLAYER.hp_max));

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