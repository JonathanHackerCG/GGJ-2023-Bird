/// @desc CONTROL: Create
event_inherited();

#macro CELLSIZE 40
#macro SCREEN_W 1920
#macro SCREEN_H 1080
collision = mp_grid_create(0, 0, SCREEN_W / CELLSIZE, SCREEN_H / CELLSIZE, CELLSIZE, CELLSIZE);

timer = -1;
player_deck = new Deck();
queue = new FunctionQueue();
targets = [];
enemies = [];
in_combat = false;

alarm[0] = 1; //Start Room

phase_queue = new FunctionQueue();
#region start_combat();
/// @func start_combat();
/// @desc Starts a combat encounter with all the nearby enemies.
function start_combat()
{
	layer_set_visible("Collision", false);
	with (obj_transition) { visible = false; }
	
	enemies = [];
	with (par_enemy)
	{
		array_push(CONTROL.enemies, id);
	}
	array_sort(enemies, function(a, b)
	{
		return a.x > b.x;
	});
	
	player_deck.start();
	in_combat = true;
	phase_restart();
}
#endregion
#region player_phase_start();
/// @func player_phase_start()
function player_phase_start()
{
	PLAYER.sap = STARTING_SAP_AMOUNT;
	player_deck.draw(STARTING_DRAW_AMOUNT);
	with (par_enemy) { choose_attack(); }
	return true;
}
#endregion
#region player_phase_input();
/// @func player_phase_input();
function player_phase_input()
{
	player_deck.draw_input();
	
	if (!instance_exists(par_enemy))
	{
		exit_combat();
	}
	
	var _check = input_check_pressed("end_turn");
	if (_check) { input_consume("end_turn"); }
	return _check;
}
#endregion
#region player_phase_end();
/// @func player_phase_end();
function player_phase_end()
{
	player_deck.discard_hand();
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
#region exit_combat(victory);
/// @func exit_combat(victory):
/// @desc Ends the combat encounter.
function exit_combat(_victory)
{
	queue.clear();
	phase_queue.clear();
	//layer_set_visible("Collision", true);
	//with (obj_transition) { visible = true; }
	
	in_combat = false;
}
#endregion