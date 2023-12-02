/// @desc Fungi Cerberus: Create
event_inherited();

hp = 10;
hp_max = hp;
attack_options		= [attack_damage, attack_heal_self, attack_heal_ally];
attack_parameters	= [[5], [3], [3]];
attack_intents		= ["[c_red]Attack[/c] - 5", "[c_lime]Heal[/c] - 3", "[c_lime]Heal Ally[] - 3"];

sound_attack = "snd_fungus_attack";