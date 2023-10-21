/// @desc MYIMGUI: Create
ImGui.__Initialize();

#region toggle_menu();
menu_enabled = true;
function toggle_menu()
{
	menu_enabled = !menu_enabled;
}
#endregion
#region Get Rooms
_rooms = [];
_rooms_ext = [];
_rooms_count = 0;
_rooms_count_ext = 0;
var i = 0;
while (room_exists(i)) {
	switch (i)
	{
		//Exclude some rooms from teleport.
		case rm_initialize:
		case rm_template:
		case rm_title:
		case rm_story:
		case rm_ui_layout:
		{
			i++;
		} break;
		//Add some rooms to the special list (debug rooms).
		case rm_combat_test:
		{
			var _name = room_get_name(i);
			array_push(_rooms_ext, _name);
		} break;
		default:
		{
			var _name = room_get_name(i);
			array_push(_rooms, _name);
		}
	}
	i++;
}
array_sort(_rooms, true);
_rooms_count = array_length(_rooms);
_rooms_count_ext = array_length(_rooms_ext);
#endregion

#region MyMenuItem(name, desc, callback);
function MyMenuItem(_name, _desc, _callback, _selected = undefined)
{
	if (ImGui.MenuItem(_name, _desc, _selected)) {
		_callback();
	}
}
#endregion