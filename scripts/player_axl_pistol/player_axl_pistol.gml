function player_axl_pistol(lvl = -1, t = 0) {
	shoot_limit = 4;
	shoot_animation = "";
	shoot_type = shoot_types.normal;
	shoot_wait = true;
	shoot_direction_index = player_get_aim_direction();

	player_shoot_pistol_animation();

	switch (t) {
		case 0: player_shoot_projectile(obj_player_axl_bullet, true); break;
		case 1: player_shoot_projectile(obj_player_axl_ray, true); shoot_limit = 3; break;
	}
	shot_id = 0;


}
