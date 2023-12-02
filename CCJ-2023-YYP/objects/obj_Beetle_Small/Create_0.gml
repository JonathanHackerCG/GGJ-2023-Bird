/// @desc Fungi Cerberus: Create
event_inherited();

hp = 10;
hp_max = hp;
attack_options		= [attack_damage, attack_damage, attack_armor_self];
attack_parameters	= [[2], [3], [5]];
attack_intents		= ["[c_red]Attack[/c] - 2", "[c_red]Attack[/c] - 3", "[c_aqua]Armor[/c] - 5"];

sound_attack = "snd_beetle_attack";