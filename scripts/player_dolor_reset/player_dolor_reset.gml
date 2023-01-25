function player_dolor_reset() {
	// Shoot
	shoot = false;
	shoot_t = 0;
	shoot_animation = "";
	shoot_limit = 15;
	shoot_next_animation = "";
	shoot_at_time = 0;
	shoot_projectile = noone;
	shoot_next_wait = false;
	shoot_wait = false;
	shoot_cancel_on_wall = false;
	shoot_type = shoot_types.normal;
	using_special_weapon = false;
	charge_enabled = true;
	y_dir = 1;


}
