/// @desc UI: Alarm 0
//Caching all the UI object's positions.
with (par_ui)
{
	variable_instance_set(UI, reference + "_x", x);
	variable_instance_set(UI, reference + "_y", y);
}

room_goto(rm_combat_test);