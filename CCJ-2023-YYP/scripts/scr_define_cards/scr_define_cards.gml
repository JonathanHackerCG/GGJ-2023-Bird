enum card
{
	//Remember: Import a new frame for spar_card_front for each of these IDs, in the same order.
	none, //First Entry
	cardA,
	cardB,
	cardC,
	cardD,
	cardE,
	//etc
	_total //Last Entry
}
#macro STARTING_DRAW_AMOUNT 5
#macro MAX_HAND_SIZE 10
#macro STARTING_SAP_AMOUNT 3

create_card(card.cardA, "Attack Weakest", "Attack enemy with lowest HP. This is a long description, for demonstration purposes.", 1)
	.add_effect(target_enemy_weakest)
	.add_effect(effect_damage, 15);

create_card(card.cardB, "Attack Random", "", 1)
	.add_effect(target_enemy_random_range, 1, 4)
	.add_effect(effect_damage, 5);

create_card(card.cardC, "Draw Cards", "", 1)
	.add_effect(target_self)
	.add_effect(effect_draw, 2)
	.add_effect(effect_draw_range, 0, 2);

create_card(card.cardD, "Get Sap", "", 1)
	.add_effect(target_self)
	.add_effect(effect_sap, 5);

create_card(card.cardE, "Damage Self", "", 1)
	.add_effect(target_self)
	.add_effect(effect_damage, 5)
	.add_effect(effect_damage_range, 1, 2);