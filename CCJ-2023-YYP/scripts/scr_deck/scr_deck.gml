/// @desc Deck "class" for holding cards.
function Deck() constructor
{
	debug = false;
	
	_cards = [];
	_cards_library = [];
	_cards_hand = [];
	_cards_discard = [];
	_cards_hold = [];
	_cards_exile = [];
	
	//Gameplay Commands
	#region gain_card(card_id);
	/// @func gain_card
	/// @desc Adds a card to the deck (use a card ID).
	/// @arg	card_id
	static gain_card = function(_card_id)
	{
		var _card = get_card(_card_id);
		array_push(_cards, _card.copy());
	}
	#endregion
	#region remove_card(card_id);
	/// @func remove_card
	/// @desc Removes one copy of a card from the deck (use a card ID).
	/// @arg	card_id
	static remove_card = function(_card_id)
	{
		var _size = get_size();
		for (var i = 0; i < _size; i++)
		{
			var _card = _cards[i];
			if (_card.get_id() == _card_id)
			{
				array_delete(_cards, i, 1);
				break;
			}
		}
	}
	#endregion
	#region get_card_count(card_id);
	/// @func get_card_count(card_id):
	/// @desc Returns the number of cards with matching card ID.
	/// @arg	card_id
	static get_card_count = function(_card_id)
	{
		var _count = 0;
		var _size = get_size();
		for (var i = 0; i < _size; i++)
		{
			var _card = _cards[i];
			if (_card.get_id() == _card_id)
			{
				_count++;
			}
		}
		return _count;
	}
	#endregion
	#region get_size();
	/// @func get_size
	/// @desc Returns the number of cards currently in the deck.
	static get_size = function()
	{
		return array_length(_cards);
	}
	#endregion
	#region recycle();
	/// @func recycle
	/// @desc Returns the discard pile to the library.
	static recycle = function()
	{
		if (array_length(_cards_discard) == 0) { exit; }
		
		AUDIO.play("snd_shuffle");
		_cards_discard = array_shuffle(_cards_discard);
		_cards_library = array_concat(_cards_discard, _cards_library);
		_cards_discard = [];
		
		if (debug)
		{
			show_debug_message("Recycle");
			show_debug_message(print());
		}
	}
	#endregion
	#region shuffle();
	/// @func shuffle
	/// @desc Shuffles the cards in the draw pile.
	static shuffle = function()
	{
		_cards_library = array_shuffle(_cards_library);
		
		if (debug)
		{
			show_debug_message("Shuffle");
			show_debug_message(print());
		}
	}
	#endregion
	#region draw_cards(number);
	/// @function draw_cards
	/// @desc Draws a number of cards. Will recycle if necessary.
	/// @arg	number
	static draw_cards = function(_number)
	{
		var _hand_size = array_length(_cards_hand);
		if (_hand_size < MAX_HAND_SIZE)
		{
			AUDIO.play("snd_card_draw");
		}
		//else { AUDIO.play("snd_unsable"); }
		
		repeat(min(_number, MAX_HAND_SIZE - _hand_size))
		{
			if (array_length(_cards_library) <= 0)
			{
				recycle();
			}
			var _card = array_pop(_cards_library);
			if (_card != undefined)
			{
				array_push(_cards_hand, _card);
			}
		}
		
		if (debug)
		{
			show_debug_message("Draw " + string(_number));
			show_debug_message(print());
		}
	}
	#endregion
	#region discard_hand();
	/// @func discard_hand
	/// @desc Discards the player's hand.
	static discard_hand = function()
	{
		_cards_discard = array_concat(_cards_discard, _cards_hand);
		_cards_hand = [];
		
		if (debug)
		{
			show_debug_message("Discard Hand");
			show_debug_message(print());
		}
	}
	#endregion
	#region discard(_card);
	/// @func discard
	/// @desc Discards a specific card.
	/// @arg	card
	static discard = function(_card)
	{
		var _size = array_length(_cards_hand);
		for (var i = 0; i < _size; i++)
		{
			if (_cards_hand[i].uid == _card.uid)
			{
				array_push(_cards_discard, _card);
				array_delete(_cards_hand, i, 1);
				return true;
			}
		}
		return false;
	}
	#endregion
	
	//Metagame
	#region start();
	/// @func start
	/// @desc Starts the card gameplay.
	static start = function()
	{
		reset();
		array_copy(_cards_library, 0, _cards, 0, get_size());
		if (debug)
		{
			show_debug_message("Start");
			show_debug_message(print());
		}
		shuffle();
	}
	#endregion
	#region reset();
	/// @func reset
	/// @desc Resets the deck to its default state.
	static reset = function()
	{
		_cards_library = [];
		_cards_hand = [];
		_cards_discard = [];
		_cards_hold = [];
		_cards_exile = [];
		
		if (debug)
		{
			show_debug_message("Reset");
			show_debug_message(print());
		}
	}
	#endregion
	#region draw_input();
	/// @func draw_input():
	/// @desc Draw/Input for Deck.
	static draw_input = function()
	{
		static CARD_XOFFSET = sprite_get_xoffset(spr_card_front);
		static CARD_YOFFSET = sprite_get_yoffset(spr_card_front);
		static STACK_SPACING = 8;
		static STACK_HEIGHT = 10;
		static DRAW_MAX_WIDTH = UI.draw_end_x - UI.draw_x;
		static DRAW_MAX_SPACING = 256;
		
		#region Health and sap.
		draw_reset();
		var xx = UI.health_x;
		var yy = UI.health_y;
		var hp_scale = PLAYER.hp / PLAYER.hp_max;
		draw_sprite(spr_ui_health, 1, xx, yy);
		draw_sprite_ext(spr_ui_health, 2, xx, yy, 1, hp_scale, 0, c_white, 1.0);
		draw_sprite(spr_ui_health, 3, xx, yy);
		draw_text_scribble(xx - 4, yy - 36, $"[fnt_card_description_outline][fa_center][fa_top]{string(PLAYER.hp)}");
		
		var xx = UI.sap_x;
		var yy = UI.sap_y;
		draw_sprite(spr_ui_sap, PLAYER.sap, xx, yy);
		#endregion
		#region Card piles.
		var count = 0;
		repeat(min(STACK_HEIGHT, array_length(_cards_library)))
		{
			draw_sprite(spr_card_back, 0, UI.library_x, UI.library_y - (count * STACK_SPACING));
			count ++;
		}
		count = 0;
		repeat(min(STACK_HEIGHT, array_length(_cards_discard)))
		{
			draw_sprite(spr_card_back_discard, 0, UI.discard_x, UI.discard_y - (count * STACK_SPACING));
			count ++;
		}
		#endregion
		#region Selecting a card to play.
		var _hand_size = array_length(_cards_hand);
		var _dis = 144;
		var _selection = -1;
		var _selection_offset = 0;
		if (mouse_y >= UI.draw_y - CARD_YOFFSET)
		{
			for (var i = 0; i < _hand_size; i++)
			{
				var _offset = i * min(DRAW_MAX_SPACING, DRAW_MAX_WIDTH / _hand_size);
				var _xpos = UI.draw_x + _offset + 144;
				if (abs(mouse_x + CARD_XOFFSET - _xpos) < _dis)
				{
					_selection = i;
					_selection_offset = _offset;
					_dis = abs(mouse_x + CARD_XOFFSET - _xpos);
				}
			}
		}
		#endregion
		#region Drawing player's hand.
		if (DEBUG && keyboard_check_pressed(ord("D")))
		{
			draw_cards(1);
		}
		
		for (var i = 0; i < _hand_size; i++)
		{
			var _offset = i * min(DRAW_MAX_SPACING, DRAW_MAX_WIDTH / _hand_size);
			if (i != _selection)
			{
				var _dir = (i - ((_hand_size - 1) / 2)) * -(30 / _hand_size);
				var _len = 1280;
				xx = UI.draw_x + _offset;
				yy = UI.draw_y + lengthdir_y(_len,  90 + _dir) + _len;
				_cards_hand[i]._draw_input(xx, yy, false, _dir);
			}
		}
		if (_selection != -1)
		{
			_cards_hand[_selection]._draw_input(UI.draw_x + _selection_offset, UI.draw_y, true);
		}
		#endregion
	}
	#endregion
	
	//Debugging
	#region print();
	/// @func print
	/// @desc Prints the contents of the Deck.
	static print = function()
	{
		var _out = "";
		_out += "Full:		" + print_card_names(_cards)					+ "\n";
		_out += "Library:	" + print_card_names(_cards_library)	+ "\n";
		_out += "Hand:		" + print_card_names(_cards_hand)			+ "\n";
		_out += "Discard:	" + print_card_names(_cards_discard)	+ "\n";
		_out += "Hold:		" + print_card_names(_cards_hold)			+ "\n";
		_out += "Exile:		" + print_card_names(_cards_exile)		+ "\n";
		return _out;
	}
	#endregion
	#region print_card_names(array);
	/// @func print
	/// @desc Prints the names of the cards in an array.
	/// @arg	array
	static print_card_names = function(_array)
	{
		var _out = "[";
		var _size = array_length(_array);
		for (var i = 0; i < _size; i++)
		{
			var _card = _array[i];
			_out += _card.get_name_string();
			if (i != _size - 1) { _out += ", "; }
		}
		_out += "]";
		return _out;
	}
	#endregion
	#region test();
	/// @func test
	/// @desc Performs a bunch of unit tests.
	static test = function()
	{
		start();
		
		draw(3);
		discard_hand();
		recycle();
	}
	#endregion
	
	gain_card(card.Heal);
	gain_card(card.Heal);
	gain_card(card.Heal);
	gain_card(card.Heal);
	gain_card(card.Beetle_Small_1);
	gain_card(card.Beetle_Small_1);
	gain_card(card.Beetle_Small_1);
	gain_card(card.Beetle_Small_1);
	gain_card(card.Beetle_Small_1);
	gain_card(card.Beetle_Small_2);
	gain_card(card.Beetle_Small_2);
	gain_card(card.Beetle_Small_2);
	//gain_card(card.Rock);
}