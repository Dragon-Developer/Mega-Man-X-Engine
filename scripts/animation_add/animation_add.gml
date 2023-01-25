/// @description Add new animation
/// @param name
/// @param key_frames
/// @param loop_start
/// @param loop_end
function animation_add() {

	var _name = argument[0];
	var str_list = string_split(_name, "|");
	var _sprite_name = _name;

	if (ds_list_size(str_list) == 2) {
		_name = str_list[| 0];
		_sprite_name = str_list[| 1];
	}

	ds_list_destroy(str_list);

	animations_frames[? _name] = (argument_count > 1) ? argument[1] : [];
	animations_loop[? _name] = [];
	animations_sprite_name[? _name] = _sprite_name;

	if (argument_count > 2) {
		animations_loop[? _name] = [argument[2], (argument_count > 3) ? argument[3] : argument[2]];
	}



}
