/// @desc Fungi Cerberus: Create
event_inherited();

hp = 14;
hp_max = hp;
attack_options		= [attack_damage, attack_damage, attack_heal_self];
attack_parameters	= [[3], [4], [1]];
attack_intents		= ["Attack - 3", "Attack - 4", "Heal - 1"];

sound_attack = "snd_fungus_attack";