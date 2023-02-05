global.__card_index = array_create(card._total, noone);
#macro card_index global.__card_index
#region get_card(card_id);
/// @func get_card(card_id):
/// @desc Returns the Card object attached to the given card ID.
/// @arg	card_id
function get_card(_card_id)
{
	return card_index[_card_id];
}
#endregion

#region Card(card_id, name, cost);
/// @func Card(card_id, name, cost):
/// @desc Card "class" for putting into the Deck and playing during combat.
/// @arg	card_id
/// @arg	name
/// @arg	cost
function Card(_card_id, _name, _cost) constructor
{
	#region get_id();
	/// @func get_id():
	static get_id = function()
	{
		return _id;
	}
	#endregion
	#region set_id(_id);
	/// @func set_id(id):
	static set_id = function(_id)
	{
		self._id = _id;
		return self;
	}
	#endregion
	set_id(_card_id);
	
	#region get_name();
	/// @func get_name():
	static get_name = function()
	{
		return _name;
	}
	#endregion
	#region set_name(_name);
	/// @func set_name(id):
	static set_name = function(_name)
	{
		self._name = _name;
		return self;
	}
	#endregion
	set_name(_name);
	
	#region get_cost();
	/// @func get_cost():
	static get_cost = function()
	{
		return _cost;
	}
	#endregion
	#region set_cost(_cost);
	/// @func set_cost(id):
	static set_cost = function(_cost)
	{
		self._cost = _cost;
		return self;
	}
	#endregion
	set_cost(_cost);
	
	_functions = [];
	_parameters = [];
	#region add_effect(function, ...);
	/// @func add_effect
	/// @desc Adds an effect to the card script.
	/// @param effect_function
	static add_effect = function(_effect_function)
	{
		var _params = [];
		for (var i = 1; i < argument_count; i++)
		{
			array_push(_params, argument[i]);
		}
		array_push(_functions, _effect_function);
		array_push(_parameters, _params);
		return self;
	}
	#endregion
	#region play();
	/// @func play
	/// @desc Plays the card (enqueuing all of its effects).
	static play = function()
	{
		var _size = array_length(_functions);
		for (var i = 0; i < _size; i++)
		{
			CONTROL.queue.insert_append(_functions[i], _parameters[i]);
		}
	}
	#endregion
	//effects[]
		//effect
		//params...
	//targets[]
		//target
		//params...
}
#endregion

#region create_card(card_id, name, cost);
/// @func create_card(card_id, name, cost):
/// @desc Creates a new Card with the provided properties. Returns the Card.
/// @arg	card_id
/// @arg	name
/// @arg	cost
function create_card(_card_id, _name, _cost)
{
	var _card = new Card(_card_id, _name, _cost);
	card_index[_card_id] = _card;
	return _card;
}
#endregion