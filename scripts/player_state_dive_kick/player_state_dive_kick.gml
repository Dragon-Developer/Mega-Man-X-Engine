function player_state_dive_kick() {
	if (substates[0] == 0) {
		var t = state_timer++;
		animation_play("dive_kick");
		if (t == 0) {
			special_inst = instance_create_depth(x, y, depth, dive_kick_object);
			special_inst.owner = id;
		}
		grav = 0;
		h_speed = 0;
		v_speed = 0;
		dive_kick_jump |= !move_x(dir * dive_kick_hspeed);
		move_y(dive_kick_vspeed);
		if (instance_exists(special_inst)){
			special_inst.x = x;
			special_inst.y = y;
		}
		if (is_on_floor()) {
			state_set(states.land);
			animation_play("land");
			move_down();
			player_counters_reset();
		} else if (dive_kick_jump) {
			v_speed = -jump_strength;
			state_set(state, 0, [1]);
			animation_play("dive_kick_jump");
		}
	} else {
		player_state_dive_kick_jump();	
	}
	player_charge_reset();
	player_saber_reset();
	if (state != states.dive_kick || substates[0] == 1) {
		using_special_weapon = false;
		special_inst = instance_try_destroy(special_inst);
	}

}
function player_state_dive_kick_jump() {
	var t = state_timer++;
	move_x(-dive_kick_end_hspeed*dir);
	if (v_speed >= 0) {
		player_check_idle();
		player_check_fall();
	}
}