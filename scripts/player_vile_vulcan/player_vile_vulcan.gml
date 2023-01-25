function player_vile_vulcan() {
	var lvl = (argument_count > 0) ? argument[0] : -1;

	shoot_limit = 6;
	shoot_animation = "";
	shoot_type = shoot_types.normal;
	shoot_wait = true;

	if (lvl == 0)
	{
		player_shoot_projectile(obj_player_vile_vulcan_1);
	}



}
