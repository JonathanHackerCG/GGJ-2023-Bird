/// @desc Card: Collision
event_inherited();

if (card_id != CARD.NONE)
{
	AUDIO.play("snd_shuffle_small");
	CONTROL.player_deck.gain_card(card_id);
	instance_create_depth(room_width / 2, room_height / 2, -room_height, obj_card_preview, {
		card_id: card_id
	});
}
instance_destroy();