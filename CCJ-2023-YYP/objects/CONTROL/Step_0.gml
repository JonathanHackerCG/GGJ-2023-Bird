/// @desc CONTROL: Step
event_inherited();

//Updating the card playing queue.
queue.update();

//Debugging
if (keyboard_check_pressed(ord("T")))
{
	//player_deck.test();
	get_card(card.cardE).play();
}