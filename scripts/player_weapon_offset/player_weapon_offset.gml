function player_weapon_offset() {
	if (is_undefined(weapon_offset[? argument[0]]))
		weapon_offset[? argument[0]] = ds_list_create();

	var l = weapon_offset[? argument[0]];
	l[| argument[1]] = [argument[2], argument[3]];



}
