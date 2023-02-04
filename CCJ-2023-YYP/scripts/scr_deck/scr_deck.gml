/// @desc Deck "class" for holding cards.
function Deck() constructor
{
	debug = true;
	
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
		array_push(_cards, _card_id);
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
		repeat(_number)
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
	
	//Debugging
	#region print();
	/// @func print
	/// @desc Prints the contents of the Deck.
	static print = function()
	{
		var _out = "";
		_out += "Full:		" + string(_cards)					+ "\n";
		_out += "Library:	" + string(_cards_library)	+ "\n";
		_out += "Hand:		" + string(_cards_hand)			+ "\n";
		_out += "Discard:	" + string(_cards_discard)	+ "\n";
		_out += "Hold:		" + string(_cards_hold)			+ "\n";
		_out += "Exile:		" + string(_cards_exile)		+ "\n";
		return _out;
	}
	#endregion
	#region test();
	/// @func test
	/// @desc Performs a bunch of unit tests.
	static test = function()
	{
		gain_card("A");
		gain_card("B");
		gain_card("C");
		gain_card("D");
		gain_card("E");
		start();
		
		draw(3);
		discard_hand();
		recycle();
	}
	#endregion
}