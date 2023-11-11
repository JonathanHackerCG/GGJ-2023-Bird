enum card
{
	//Remember: Import a new frame for spr_card_front for each of these IDs, in the same order.
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

//Targeting functions.
//target_self();
//target_selection();
//select_enemy_strongest();
//select_enemy_weakest();
//target_enemy_random(number);
//target_enemy_random_range(min, max);

//Attacking functions.
//effect_damage(amount);
//effect_damage_range(min, max);

//effect_heal(amount);
//effect_heal_range(min, max);

//effect_armor(amount);
//effect_armor_range(min, max);

//effect_sap(amount);
//effect_sap_range(min, max);

//effect_draw(amount);
//effect_draw_range(min, max);

//Enemy attacking functions.
//attack_damage(_amount);
//attack_heal_self(_amount);
//attack_heal_ally(_amount);
//attack_armor_self(_amount);
//attack_armor_ally(_amount);

//Damage handling.
//take_damage(amount);
//heal(amount);
//gain_sap(amount);
//gain_armor(amount);

//Internal usage (don't touch).
//_with_targets(function, parameters);

//Marks Cards
#region Free Cards
create_card(card.SapAdder, "", "", 0)
	.add_effect(target_self)
	.add_effect(effect_sap_range, 1, 2);
	
create_card(card.Heal, "", "3-5 Heal\n3-5 Armor", 0)
	.add_effect(target_self)
	.add_effect(effect_heal_range, 3, 5)
	.add_effect(effect_armor_range, 3, 5);
	
//with (create_card(card.Heal, "", "3-5 Heal\n3-5 Armor", 0))
//{
//    add_effect(target_self);
//    repeat(5)
//    {
//        add_effect(effect_heal_range, 3, 5);
//        add_effect(effect_armor_range, 3, 5);
//    }
//}
	
create_card(card.Rock, "", "15-30 Attack to Random Enemy \n -10 to 15 Health", 0)
	.add_effect(target_selection)
	.add_effect(effect_damage_range, 5, 10)
	.add_effect(target_self)
	.add_effect(effect_damage_range, 3, 10); 
#endregion



#region Beetle Cards
create_card(card.Beetle_Small_1, "Attack", "Attack a Enemy for 4", 1)
	.add_effect(target_selection)	
	.add_effect(effect_damage, 4);
	
create_card(card.Beetle_Small_2, "Defend", "Add 4 armor", 1)
	.add_effect(target_self)
	.add_effect(effect_armor, 4);
	
with (create_card(card.Beetle_Small_3, "Multi-Attack", "Attack for 2 on 2 Enemies", 1))
{
    add_effect(target_self);
    repeat(2)
    {
        add_effect(target_selection)	
		add_effect(effect_damage, 4);
    }
}
	
create_card(card.Beetle_Big, "Shield Bash", "Attack weakest enemy for 5 damage \n gain 3 armor", 2)
	.add_effect(select_enemy_weakest)
	.add_effect(effect_damage, 5)
	.add_effect(target_self)
	.add_effect(effect_armor, 4);

#endregion

#region Fungi Cards
create_card(card.Fungi_Small_1, "Fungi", "4 Attack to Random Enemy \n +1 Health", 2)
	.add_effect(target_enemy_random, 1)
	.add_effect(effect_damage, 4)
	.add_effect(target_self) // Change to lowest damage
	.add_effect(effect_heal, 1);
	
create_card(card.Fungi_Small_2, "Fungi", "3 Attack to Weakest Enemy \n +1 Sap", 2)
	.add_effect(select_enemy_weakest) // Change to lowest health
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