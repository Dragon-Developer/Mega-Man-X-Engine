function player_state_tatsumaki() {
	var t = state_timer++;
	var used_on_floor = substates[0];

	grav = 0;
	v_speed = 0;
	using_special_weapon = true;
	if (t == 0)
		player_activate_immunity(immunity_types.normal);
	player_effects_reset();

	// Play Animation
	animation_play(tatsumaki_animation);
	// Movement
	if (t < 6 && used_on_floor) {
		move_contact_block(0, -2);
	}
	move_x(dir * tatsumaki_hspeed);

	if (t == 0) {
		// Hitbox
		special_inst = instance_create_depth(x, y, depth, tatsumaki_object);
		special_inst.sprite_index = tatsumaki_sprite;
		// Sound
		audio_play(tatsumaki_sound);
	}
	// Hitbox - Position
	if (instance_exists(special_inst)) {
		special_inst.x = x;
		special_inst.y = y;
	}

	if (t >= tatsumaki_limit) {
		substates[0] = 0;
		player_check_idle();
		player_check_fall();
		if (is_on_floor())
			player_counters_reset();
		special_inst = instance_try_destroy(special_inst);
	}

	dash_tapped = false;
	player_charge_reset();

	if (state != states.tatsumaki) {
		charge_enabled = true;
		using_special_weapon = false;
		immunity = false;
		if (!is_on_floor())
			dash_air_count++;
	}


}
