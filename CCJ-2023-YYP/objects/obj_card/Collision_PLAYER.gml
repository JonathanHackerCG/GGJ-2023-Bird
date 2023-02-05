/// @desc Card: Collision
event_inherited();

if (card_id != card.none)
{
	CONTROL.player_deck.gain_card(card_id);
}
instance_destroy();