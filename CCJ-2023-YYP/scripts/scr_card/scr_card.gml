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
	
	#region get_name_string();
	/// @func get_name_string():
	static get_name_string = function()
	{
		return _name;
	}
	#endregion
	#region get_name_scribble();
	/// @func get_name_scribble():
	static get_name_scribble = function()
	{
		return _name_scribble;
	}
	#endregion
	#region set_name(_name);
	/// @func set_name(id):
	static set_name = function(_name)
	{
		self._name = _name;
		self._name_scribble = scribble(_name)
			.starting_format(FONT_NAME, c_black)
			.align(fa_left, fa_middle);
		return self;
	}
	#endregion
	set_name(_name);
	
	#region get_description_string();
	/// @func get_description_string():
	/// @desc	Returns the card description as a string.
	static get_description_string = function()
	{
		return _description;
	}
	#endregion
	#region get_description_scribble();
	/// @func get_description_scribble():
	/// @desc	Returns the card description as a Scribble class.
	static get_description_scribble = function()
	{
		return _description_scribble;
	}
	#endregion
	#region set_description(_description);
	/// @func set_description(id):
	static set_description = function(_description)
	{
		self._description = _description;
		self._description_scribble = scribble(_description)
			.starting_format(FONT_DESCRIPTION, c_black)
			.align(fa_left, fa_top)
			.wrap(230);
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
	/// @arg	x
	/// @arg	y
	/// @arg	[selected]
	/// @arg	[angle]
	static _draw_input = function(_x, _y, _selected = false, _angle = 0)
	{
		static SELECTED_OFFSET = 32;
		static CARD_XOFFSET = sprite_get_xoffset(spr_card_front);
		static CARD_YOFFSET = sprite_get_yoffset(spr_card_front);
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
		draw_rectangle_set(2, 2, sprite_get_width(spr_card_front) - 2, sprite_get_height(spr_card_front) - 2, true, c_lime);
		draw_sprite(spr_card_front, get_id(), CARD_XOFFSET, CARD_YOFFSET);
		get_name_scribble().draw(NAME_X, NAME_Y);
		get_description_scribble().draw(DESC_X, DESC_Y);
		if (get_cost() > 0)
		{
			draw_text_set(COST_X, COST_Y, string(get_cost()), fnt_card_number, fa_center, fa_center, c_white);
		}
		#endregion
		surface_reset_target();
		
		var xx = _x - CARD_XOFFSET/* + lengthdir_x(CARD_XOFFSET, _angle - 90)*/;
		var yy = _y - CARD_YOFFSET/* + lengthdir_y(CARD_YOFFSET, _angle - 90)*/;
		draw_surface_ext(surf, xx, yy, 1, 1, _angle, c_white, 1.0);
	}
	#endregion
	
	#region copy();
	/// @func copy
	/// @desc Returns a deep copy of the Card.
	static copy = function()
	{
		var _card = new Card(get_id(), get_name_string(), get_description_string(), get_cost());
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