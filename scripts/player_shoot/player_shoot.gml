function player_shoot() {
	//shoot = true;
	previous_charge_level = argument[0];
	previous_shot_id = argument[1];
	if (weapon_script != noone)
		script_execute(weapon_script, argument[0], argument[1]);


}
