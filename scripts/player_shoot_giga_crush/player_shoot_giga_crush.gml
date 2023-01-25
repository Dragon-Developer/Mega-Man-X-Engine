function player_shoot_screen_cleaner(projectile, shoot_time = 0, limit = 98) {
	state_set(states.screen_cleaner, 0);
	shoot_next_projectile = projectile;
	player_add_projectile();
	shoot_limit = limit;
	shoot_at_time = shoot_time;
	player_activate_immunity(immunity_types.normal);
}
