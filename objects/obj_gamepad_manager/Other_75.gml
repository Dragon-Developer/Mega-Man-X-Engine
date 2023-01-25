switch(async_load[? "event_type"]) {             // Parse the async_load map to see which event has been triggered
	case "gamepad discovered":                     // A game pad has been discovered
	    var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
	    global.gp_id = pad;
		global.gp_name = gamepad_get_description(global.gp_id);
		global.gamepad_list_index = ds_list_size(global.gamepad_list);
		var _ind = ds_list_find_index(global.gamepad_list, pad);
		if (_ind == -1)
			ds_list_add(global.gamepad_list, pad);
		global.gp_movement = gamepad_get_movement_mode(global.gp_id);
	    break;
	case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
	    var pad = async_load[? "pad_index"];       // Get the pad index
		global.gp_id = -1;
		var _ind = ds_list_find_index(global.gamepad_list, pad);
		if (_ind != -1)
			ds_list_delete(global.gamepad_list, _ind);
	    if (ds_list_empty(global.gamepad_list)) {
			global.settings[1] = input_types.keyboard;
			global.gamepad_list_index = 0;
		} else if (global.settings[1] == input_types.gamepad) {
			global.gamepad_list_index = ds_list_size(global.gamepad_list) - 1;
			global.gp_id = global.gamepad_list[| global.gamepad_list_index];
			global.gp_name = gamepad_get_description(global.gp_id);
		}
		break;
}