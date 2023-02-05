enum card
{
	none, //First Entry
	cardA,
	cardB,
	cardC,
	cardD,
	cardE,
	//etc
	_total //Last Entry
}
#macro STARTING_DRAW_AMOUNT 10
#macro MAX_HAND_SIZE 10

create_card(card.cardA, "A Card", 1);
create_card(card.cardB, "B Card", 1);
create_card(card.cardC, "C Card", 1);
create_card(card.cardD, "D Card", 1);

create_card(card.cardE, "E Card", 1)
	.add_effect(target_self)
	.add_effect(effect_damage, 5)
	.add_effect(effect_damage_range, 1, 2);