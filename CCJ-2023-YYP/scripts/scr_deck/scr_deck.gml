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
	#region gain_card(_card_id);
	/// @func gain_card
	/// @desc Adds a card to the deck (use a card ID).
	/// @arg	card_id
	static gain_card = function(_card_id)
	{
		var _card = get_card(_card_id);
		array_push(_cards, _card.copy());
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
	#region draw(number);
	/// @function draw
	/// @desc Draws a number of cards. Will recycle if necessary.
	/// @arg	number
	static draw = function(_number)
	{
		var _hand_size = array_length(_cards_hand);
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
	static draw_input = function()
	{
		static STACK_SPACING = 8;
		static STACK_HEIGHT = 10;
		static DRAW_MAX_WIDTH = UI.draw_end_x - UI.draw_x;
		static DRAW_MAX_SPACING = 256;
		
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
		if (mouse_y >= UI.draw_y)
		{
			for (var i = 0; i < _hand_size; i++)
			{
				var _offset = i * min(DRAW_MAX_SPACING, DRAW_MAX_WIDTH / _hand_size);
				var _xpos = UI.draw_x + _offset + 144;
				if (abs(mouse_x - _xpos) < _dis)
				{
					_selection = i;
					_selection_offset = _offset;
					_dis = abs(mouse_x - _xpos);
				}
			}
		}
		#endregion
		#region Drawing player's hand.
		for (var i = 0; i < _hand_size; i++)
		{
			var _offset = i * min(DRAW_MAX_SPACING, DRAW_MAX_WIDTH / _hand_size);
			if (i != _selection)
			{
				_cards_hand[i]._draw_input(UI.draw_x + _offset, UI.draw_y, false);
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
			_out += _card.get_name();
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
}