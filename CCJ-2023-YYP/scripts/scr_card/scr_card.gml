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
/// @arg	description
/// @arg	cost
function Card(_card_id, _name, _description, _cost) constructor
{
	static _uid = 0;
	uid = _uid++;
	
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
	
	#region get_description();
	/// @func get_description():
	static get_description = function()
	{
		return _description;
	}
	#endregion
	#region set_description(_description);
	/// @func set_description(id):
	static set_description = function(_description)
	{
		self._description = _description;
		return self;
	}
	#endregion
	set_description(_description);
	
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
		AUDIO.play("snd_card_place");
		var _size = array_length(_functions);
		for (var i = 0; i < _size; i++)
		{
			CONTROL.queue.insert_append(_functions[i], _parameters[i]);
		}
	}
	#endregion
	
	surf = undefined;
	#region _update_surface();
	/// @func _update_surface();
	/// @desc	Internal method to update the card drawing surface.
	static _update_surface = function()
	{
		if (surf == undefined || !surface_exists(surf))
		{
			surf = surface_create(sprite_get_width(spr_card_front), sprite_get_height(spr_card_front));
		}
	}
	#endregion
	#region _draw_input(x, y);
	/// @func _draw_input(x, y, selected);
	/// @desc Internal draw method called by Deck.
	static _draw_input = function(_x, _y, _selected)
	{
		static SELECTED_OFFSET = 32;
		static NAME_X = 64;
		static NAME_Y = 96;
		static COST_X = 256;
		static COST_Y = 72;
		static DESC_X = 68;
		static DESC_Y = 384;
		
		_update_surface();
		surface_set_target(surf);
		draw_clear_alpha(c_white, 0.0);
		if (_selected)
		{
			_y -= SELECTED_OFFSET;
			draw_sprite_animated(spr_card_shimmer, 0, 0);
			
			#region Playing the card (input).
			if (input_check_pressed("confirm") && PLAYER.sap >= get_cost())
			{
				input_consume("confirm");
				PLAYER.sap -= get_cost();
				play();
				CONTROL.player_deck.discard(self);
			}
			#endregion
		}
		
		#region Drawing contents of the card.
		draw_sprite(spr_card_front, get_id(), 0, 0);
		draw_text_set(NAME_X, NAME_Y, get_name(), fnt_card_name, fa_left, fa_center, c_black);
		if (get_cost() > 0)
		{
			draw_text_set(COST_X, COST_Y, string(get_cost()), fnt_card_number, fa_center, fa_center, c_white);
		}
		draw_text_set_ext(DESC_X, DESC_Y, get_description(), 20, 230, fnt_card_description, fa_left, fa_top, c_black);
		#endregion
		surface_reset_target();
		draw_surface(surf, _x, _y);
	}
	#endregion
	
	#region copy();
	/// @func copy
	/// @desc Returns a deep copy of the Card.
	static copy = function()
	{
		var _card = new Card(get_id(), get_name(), get_description(), get_cost());
		array_copy(_card._functions, 0, _functions, 0, array_length(_functions));
		array_copy(_card._parameters, 0, _parameters, 0, array_length(_parameters));
		return _card;
	}
	#endregion
}
#endregion

#region create_card(card_id, name, cost);
/// @func create_card(card_id, name, cost):
/// @desc Creates a new Card with the provided properties. Returns the Card.
/// @arg	card_id
/// @arg	name
/// @arg	description
/// @arg	cost
function create_card(_card_id, _name, _description, _cost)
{
	var _card = new Card(_card_id, _name, _description, _cost);
	card_index[_card_id] = _card;
	return _card;
}
#endregion