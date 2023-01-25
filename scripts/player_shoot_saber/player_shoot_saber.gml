function player_shoot_saber() {
	if (state == states.dolor) exit;
	player_state_set(states.x3_saber, 0);
	shoot_next_projectile = argument[0];
	player_add_projectile();
	shoot_next_wait = true;	
	shoot_limit = 52;
}
