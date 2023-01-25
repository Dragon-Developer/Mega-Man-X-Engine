function player_weapon_offsets() {
	if (is_undefined(weapon_offset[? argument[0]]))
		weapon_offset[? argument[0]] = ds_list_create();

	var l = weapon_offset[? argument[0]];
	var arr = argument[1];
	for (var i = 0; i < array_length_1d(arr); i++) {
		l[| i] = arr[i];
	}


}
