function player_check_nova_strike() {
	if ((key_p_special || (key_p_shoot && weapon[0] == weapons.nova_strike))
	&& can_move_x(dir) && (is_on_floor() || dash_air_count < dash_air_limit)
	&& !using_special_weapon
	&& player_weapon_can_spend(weapons.nova_strike)
	)
	{
		if (!player_weapon_spend(weapons.nova_strike)) return;
		if (state == states.wall_slide) xscale = dir;
		player_state_set(states.nova_strike, 0);
		animation = "";
		animation_play("nova_strike");
		dash_air_count++;
	}


}
