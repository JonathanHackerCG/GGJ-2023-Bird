/// @desc CONTROL: Step
event_inherited();

//Updating the card playing queue.
queue.update();

//Debugging
if (keyboard_check_pressed(ord("T")))
{
	player_deck.gain_card(card.cardA);
	player_deck.gain_card(card.cardA);
	player_deck.gain_card(card.cardA);
	player_deck.gain_card(card.cardB);
	player_deck.gain_card(card.cardB);
	player_deck.gain_card(card.cardB);
	player_deck.gain_card(card.cardC);
	player_deck.gain_card(card.cardC);
	player_deck.gain_card(card.cardC);
	player_deck.gain_card(card.cardD);
	player_deck.gain_card(card.cardD);
	player_deck.gain_card(card.cardD);
	player_deck.gain_card(card.cardE);
	player_deck.gain_card(card.cardE);
	player_deck.gain_card(card.cardE);
	start_combat();
}

if (keyboard_check_pressed(vk_f1))
{
	player_deck.discard_hand();
}

if (keyboard_check_pressed(vk_f2))
{
	player_deck.draw(1);
}