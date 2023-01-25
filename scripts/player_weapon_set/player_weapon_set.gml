function player_weapon_set() {
	var _id = argument[0];
	var _weapon = argument[1];

	weapon_list[_id] = _weapon;

	if (_weapon == weapons.speed_gear) {
		double_gear_unlocked = true;	
	}

}
