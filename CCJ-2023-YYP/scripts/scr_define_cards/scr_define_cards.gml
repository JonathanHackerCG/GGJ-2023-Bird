enum card
{
	//Remember: Import a new frame for spar_card_front for each of these IDs, in the same order.
	none, //First Entry
	cardA,
	cardB,
	cardC,
	cardD,
	cardE,
	SapAdder,
	Heal,
	Rock,
	Beetle_Small_1,
	Beetle_Small_2,
	Beetle_Small_3,
	Beetle_Big,
	Fungi_Small_1,
	Fungi_Small_2,
	Fungi_Big_1,
	Fungi_Big_2,
	Fungi_Big_3,
	//etc
	_total //Last Entry
}
#macro STARTING_DRAW_AMOUNT 5
#macro MAX_HAND_SIZE 10
#macro STARTING_SAP_AMOUNT 3

//Marks Cards
#region Free Cards
create_card(card.SapAdder, "", "", 0)
	.add_effect(target_self)
	.add_effect(effect_sap_range, 1, 2)
	.add_effect(effect_heal, 1);
	
create_card(card.Heal, "", "", 0)
	.add_effect(target_self)
	.add_effect(effect_sap_range, 3, 5);
	
create_card(card.Rock, "", "15-30 Attack to Random Enemy \n -10 to 15 Health", 0)
	.add_effect(target_self)
	.add_effect(effect_damage_range, 10, 15)
	.add_effect(target_enemy_random, 1) // Change this to dealing damage to others
	.add_effect(effect_damage_range, 15, 30); 
#endregion

#region Beetle Cards
create_card(card.Beetle_Small_1, "Beetle", "4 Attack to Random Enemy \n +1 Health", 1)
	.add_effect(target_enemy_random, 1) // Change to random enemy
	.add_effect(effect_damage, 4)
	.add_effect(target_self)
	.add_effect(effect_heal, 1);
	
create_card(card.Beetle_Small_2, "Beetle", "3 Attack to Weakest Enemy \n +1 Health", 1)
	.add_effect(target_enemy_weakest) // Change to lowest health
	.add_effect(effect_damage, 3)
	.add_effect(target_self)
	.add_effect(effect_heal, 1);
	
create_card(card.Beetle_Small_3, "Beetle", "+5 Health", 1)
	.add_effect(target_self) // Change to lowest damage
	.add_effect(effect_heal, 5);
	
create_card(card.Beetle_Big, "Big Beetle", "3-5 Attack to 2 Random Enemies", 3)
	.add_effect(target_enemy_random, 2) // Change to 2 random enemies
	.add_effect(effect_damage_range, 3, 5);
#endregion

#region Fungi Cards
create_card(card.Fungi_Small_1, "Fungi", "4 Attack to Random Enemy \n +1 Health", 2)
	.add_effect(target_enemy_random, 1)
	.add_effect(effect_damage, 4)
	.add_effect(target_self) // Change to lowest damage
	.add_effect(effect_heal, 1);
	
create_card(card.Fungi_Small_2, "Fungi", "3 Attack to Weakest Enemy \n +1 Sap", 2)
	.add_effect(target_enemy_weakest) // Change to lowest health
	.add_effect(effect_damage, 3)
	.add_effect(target_self) // Change to lowest damage
	.add_effect(effect_sap, 1);
	
create_card(card.Fungi_Big_1, "Big Fungi", "3-7 Attack to 3 Random Enemies", 5)
	.add_effect(target_enemy_random, 3) 
	.add_effect(effect_damage_range, 3, 7);
	
create_card(card.Fungi_Big_2, "Big Fungi", "3-5 Attack to 2 Random Enemies", 3)
	.add_effect(target_enemy_random, 2) 
	.add_effect(effect_damage_range, 3, 5);
	
create_card(card.Fungi_Big_3, "Big Fungi", "4 Attack to 5 Random Enemies", 5)
	.add_effect(target_enemy_random, 5) 
	.add_effect(effect_damage, 4);
#endregion

