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

create_card(card.cardA, "A", 1);
create_card(card.cardB, "B", 1);
create_card(card.cardC, "C", 1);
create_card(card.cardD, "D", 1);

create_card(card.cardE, "E", 1)
	.add_effect(target_self)
	.add_effect(effect_damage, 5)
	.add_effect(effect_damage_range, 1, 2);