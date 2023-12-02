enum CARD
{
	//Remember: Import a new frame for spr_card_front for each of these IDs, in the same order.
	NONE, //First Entry
	CARD_A,
	CARD_B,
	CARD_C,
	CARD_D,
	CARD_E,
	SAP_ADDER,
	HEAL,
	ROCK,
	BEETLE_SMALL_1,
	BEETLE_SMALL_2,
	BEETLE_SMALL_3,
	BEETLE_BIG,
	FUNGI_SMALL_1,
	FUNGI_SMALL_2,
	FUNGI_BIG_1,
	FUNGI_BIG_2,
	FUNGI_BIG_3,
	//etc
	_TOTAL //Last Entry
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
create_card(CARD.SAP_ADDER, "", "", 0)
	.add_effect(target_self)
	.add_effect(effect_sap_range, 1, 2);
	
create_card(CARD.HEAL, "", "3-5 Heal\n3-5 Armor", 0)
	.add_effect(target_self)
	.add_effect(effect_heal_range, 3, 5)
	.add_effect(effect_armor_range, 3, 5);
	
//with (create_card(CARD.Heal, "", "3-5 Heal\n3-5 Armor", 0))
//{
//    add_effect(target_self);
//    repeat(5)
//    {
//        add_effect(effect_heal_range, 3, 5);
//        add_effect(effect_armor_range, 3, 5);
//    }
//}
	
create_card(CARD.ROCK, "", "15-30 Attack to Random Enemy \n -10 to 15 Health", 0)
	.add_effect(target_selection)
	.add_effect(effect_damage_range, 5, 10)
	.add_effect(target_self)
	.add_effect(effect_damage_range, 3, 10); 
#endregion



#region Beetle Cards
create_card(CARD.BEETLE_SMALL_1, "Attack", "Attack a Enemy for 4", 1)
	.add_effect(target_selection)	
	.add_effect(effect_damage, 4);
	
create_card(CARD.BEETLE_SMALL_2, "Defend", "Add 4 armor", 1)
	.add_effect(target_self)
	.add_effect(effect_armor, 4);
	
with (create_card(CARD.BEETLE_SMALL_3, "Multi-Attack", "Attack for 2 on 2 Enemies", 1))
{
    add_effect(target_self);
    repeat(2)
    {
        add_effect(target_selection)	
		add_effect(effect_damage, 4);
    }
}
	
create_card(CARD.BEETLE_BIG, "Shield Bash", "Attack weakest enemy for 5 damage \n gain 3 armor", 2)
	.add_effect(select_enemy_weakest)
	.add_effect(effect_damage, 5)
	.add_effect(target_self)
	.add_effect(effect_armor, 4);

#endregion

#region Fungi Cards
with (create_card(CARD.FUNGI_SMALL_1, "Small Sweep", "Attack 5 enemies for \n 1 damage", 1))
{
    add_effect(target_self);
    repeat(5)
    {
        add_effect(target_selection)	
		add_effect(effect_damage, 1);
    }
}
	
with (create_card(CARD.FUNGI_SMALL_2, "Trifecta", "3 Attack to Weakest Enemy \n +1 Sap", 2))
{
    add_effect(target_self);
    repeat(3)
    {
        add_effect(target_selection)	
		add_effect(effect_damage, 3);
    }
}
	
with (create_card(CARD.FUNGI_BIG_1, "Shield Charge", "Attack 2 enemies for \n 4 damage  \n gain 4 armor", 2))
{
    add_effect(target_self);
    repeat(3)
    {
        add_effect(target_selection)	
		add_effect(effect_damage, 3);
    }
	add_effect(target_self)
	add_effect(effect_armor, 4);
}
	
create_card(CARD.FUNGI_BIG_2, "Big Fungi", "3-5 Attack to 2 Random Enemies", 3)
	.add_effect(target_enemy_random, 2) 
	.add_effect(effect_damage_range, 3, 5);
	
create_card(CARD.FUNGI_BIG_3, "Big Fungi", "4 Attack to 5 Random Enemies", 5)
	.add_effect(target_enemy_random, 5) 
	.add_effect(effect_damage, 4);
#endregion