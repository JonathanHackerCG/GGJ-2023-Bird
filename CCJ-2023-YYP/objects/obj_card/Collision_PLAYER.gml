/// @desc Card: Collision
event_inherited();

if (card_id != CARD.NONE)
{
	AUDIO.play("snd_shuffle_small");
	CONTROL.player_deck.gain_card(card_id);
}
instance_destroy();