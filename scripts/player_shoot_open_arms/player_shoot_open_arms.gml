function player_shoot_open_arms() {
	if (state == states.dolor) exit;
	state_set(states.open_arms, 0);
	shoot_next_projectile = argument[0];
	player_add_projectile();
	shoot_limit = 48;
	shoot_at_time = 8;


}
