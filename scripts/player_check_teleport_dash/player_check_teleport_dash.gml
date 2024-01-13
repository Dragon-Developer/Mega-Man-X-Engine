function player_check_teleport_dash() {
	if (key_p_shoot2 && !key_up && !key_down && !using_special_weapon
	&& (is_on_floor() || dash_air_count < dash_air_limit)
	) {
		dash_air_count++;
		player_state_set(states.teleport_dash, 0, [0]);
		ds_list_clear(immunity_list);
		player_activate_immunity(immunity_types.spike);
		player_activate_immunity(immunity_types.normal);
		instance_try_destroy(special_inst);	
		using_special_weapon = true;
	}
}
