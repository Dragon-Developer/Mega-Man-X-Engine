function player_shoot_giga_crush() {
	state_set(states.giga_crush, 0);
	shoot_next_projectile = argument[0];
	player_add_projectile();
	shoot_limit = 235;
	shoot_at_time = 126;
}
