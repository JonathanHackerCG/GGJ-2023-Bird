/// @desc MYIMGUI: Step
ImGui.__Update();

#region Hotkeys
	#region Enable/Disable
	if (keyboard_check_pressed(vk_f12)) { toggle_menu(); }
	#endregion
	if (!menu_enabled) { exit; }
	if (keyboard_check(vk_control))
	{
		#region R - Restart Room
		if (keyboard_check_pressed(ord("R")))
		{
			room_restart();
		}
		#endregion
		if (keyboard_check(vk_shift))
		{
			#region R - Restart Game
			if (keyboard_check_pressed(ord("R")))
			{
				game_restart();
			}
			#endregion
			#region Q - Quit Game
			if (keyboard_check_pressed(ord("Q")))
			{
				game_end();
			}
			#endregion
		}
	}
	if (CONTROL.in_combat)
	{
		#region Esc - Exit Combat
		if (keyboard_check(vk_escape))
		{
			CONTROL.exit_combat();
		}
		#endregion
	}
#endregion

if (ImGui.BeginMainMenuBar("Debug", true)) {
	ImGui.Text("Debug (F12)");
	ImGui.Separator();
	#region File
	if (ImGui.BeginMenu("File")) {
		#region Room
		if (ImGui.BeginMenu("Room")) {
			ImGui.Text("Current Room: " + room_get_name(room));
			ImGui.Separator();
			#region >>> Goto
			if (ImGui.BeginMenu("Goto")) {
				for (var i = 0; i < _rooms_count; i++) {
					var _name = _rooms[i];
					if (ImGui.MenuItem(_name)) {
						room_goto(asset_get_index(_name));
						if (!instance_exists(PLAYER))
						{
							instance_create_layer(room_width / 2, room_height / 2, "Instances", PLAYER);
						}
					}
				}
				if (ImGui.BeginMenu("Extra")) {
					for (var i = 0; i < _rooms_count_ext; i++) {
						var _name = _rooms_ext[i];
						if (ImGui.MenuItem(_name)) {
							room_goto(asset_get_index(_name));
							if (!instance_exists(PLAYER))
							{
								instance_create_layer(room_width / 2, room_height / 2, "Instances", PLAYER);
							}
						}
					}
				ImGui.EndMenu(); }
			ImGui.EndMenu(); }
			#endregion
			MyMenuItem("Restart", "Ctrl+R", room_restart);
		ImGui.EndMenu(); }
		#endregion
		#region Game
		if (ImGui.BeginMenu("Game")) {
			MyMenuItem("Restart", "Ctrl+Shift+R", game_restart);
			MyMenuItem("Quit", "Ctrl+Shift+Q", game_end);
		ImGui.EndMenu(); }
		#endregion
	ImGui.EndMenu(); }
	#endregion
	#region View
	if (ImGui.BeginMenu("View")) {
		#region Collision
		layer_set_visible("Collision", ImGui.Checkbox("Collision", layer_get_visible("Collision")));
		#endregion
	ImGui.EndMenu(); }
	#endregion
	#region Combat
	if (ImGui.BeginMenu("Combat", CONTROL.in_combat)) {
		MyMenuItem("Skip", "Esc", CONTROL.exit_combat);
	ImGui.EndMenu(); }
	#endregion
	
ImGui.EndMainMenuBar(); }