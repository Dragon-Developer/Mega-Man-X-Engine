function player_megaman_dive_missile(lvl = -1, t = 0) {
	charge_level = -1;
	shoot_type = shoot_types.normal;
	shoot_limit = 16;
	shoot_animation = "";
	player_shoot_projectile(obj_player_megaman_shot_dive_missile);
	shot_id = 0;
}
