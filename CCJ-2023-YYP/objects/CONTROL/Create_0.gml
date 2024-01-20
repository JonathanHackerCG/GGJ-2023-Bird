/// @desc CONTROL: Create
event_inherited();

show_ui = true;

#macro CELLSIZE 40
#macro SCREEN_W 1920
#macro SCREEN_H 1080
collision = mp_grid_create(0, 0, SCREEN_W / CELLSIZE, SCREEN_H / CELLSIZE, CELLSIZE, CELLSIZE);

timer = -1;
player_deck = new Deck();
queue = new FunctionQueue();
targets = [];
enemies = [];
selected_index = -1;
selected_enemy = noone;
in_combat = false;
in_player_phase = false;

alarm[0] = 1; //Start Room

phase_queue = new FunctionQueue();
#region start_combat();
/// @func start_combat();
/// @desc Starts a combat encounter with all the nearby enemies.
function start_combat()
{
	layer_set_visible("Collision", false);
	with (obj_transition) { visible = false; }
	AUDIO.music(choose(msc_battle1, msc_battle2, msc_battle3));
	
	enemies = [];
	with (par_enemy)
	{
		array_push(CONTROL.enemies, id);
	}
	array_sort(enemies, function(a, b)
	{
		return a.x > b.x;
	});
	selected_index = -1;
	select_next_enemy();
	
	player_deck.start();
	in_combat = true;
	in_player_phase = false;
	phase_restart();
}
#endregion
#region player_phase_start();
/// @func player_phase_start()
function player_phase_start()
{
	AUDIO.play("snd_pass_turn_enemy");
	PLAYER.sap = STARTING_SAP_AMOUNT;
	PLAYER.armor = 0;
	player_deck.draw_cards(STARTING_DRAW_AMOUNT);
	with (par_enemy) { choose_attack(); }
	return true;
}
#endregion
#region player_phase_input();
/// @func player_phase_input();
function player_phase_input()
{
	in_player_phase = true;
	if (!instance_exists(par_enemy))
	{
		exit_combat();
	}
	
	var _check = input_check_pressed("end_turn");
	if (input_check_pressed("confirm") && point_distance(mouse_x, mouse_y, UI.end_turn_x, UI.end_turn_y) <= 80)
	{
		_check = true;
	}
	if (_check)
	{
		input_consume("end_turn");
		input_consume("confirm");
		in_player_phase = false;
	}
	return _check;
}
#endregion
#region player_phase_end();
/// @func player_phase_end();
function player_phase_end()
{
	AUDIO.play("snd_pass_turn");
	player_deck.discard_hand();
	with (par_enemy) { armor = 0; }
	return true;
}
#endregion
#region enemy_phase_update();
function enemy_phase_update()
{
	static _current = 0;
	if (_current >= instance_number(par_enemy))
	{
		_current = 0;
		return true;
	}
	
	var _enemy = enemies[_current];
	with (_enemy) { attack(); }
	_current ++;
	timer = second(0.5);
	return false;
}
#endregion
#region phase_restart();
function phase_restart()
{
	phase_queue.clear();
	phase_queue.insert_append(player_phase_start);
	phase_queue.insert_append(player_phase_input);
	phase_queue.insert_append(player_phase_end);
	phase_queue.insert_append(enemy_phase_update);
	phase_queue.insert_append(phase_restart);
	return true;
}
#endregion
#region select_enemy(id);
function select_enemy(_id)
{
	selected_enemy = _id;
	selected_index = array_find_index(enemies, function(_element, _index)
	{
		return (_element == selected_enemy);
	});
}
#endregion
#region select_next_enemy();
function select_next_enemy()
{
	selected_index ++;
	selected_index = wrap(selected_index, 0, array_length(enemies));
	selected_enemy = enemies[selected_index];
}
#endregion
#region exit_combat(victory);
/// @func exit_combat(victory):
/// @desc Ends the combat encounter.
/// @arg	[victory]	Default: true
function exit_combat(_victory = true)
{
	with (par_enemy)
	{
		instance_destroy();
	}
	
	queue.clear();
	phase_queue.clear();
	AUDIO.music(msc_exploration1);
	
	in_combat = false;
}
#endregion
randomize();