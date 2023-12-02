/// @desc Fungi Cerberus: Create
event_inherited();

hp = 25;
hp_max = hp;
attack_options		= [attack_damage, attack_damage, attack_heal_self];
attack_parameters	= [[5], [9], [3]];
attack_intents		= ["[c_red]Attack[/c] - 5", "[c_red]Attack[/c] - 9", "[c_lime]Heal[/c] - 3"];

sound_attack = "snd_fungus_attack";