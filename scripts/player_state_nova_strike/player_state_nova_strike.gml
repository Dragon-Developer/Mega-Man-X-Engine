function player_state_nova_strike() {
	var t = state_timer++;

	grav = 0;
	v_speed = 0;
	using_special_weapon = true;

	player_effects_reset();
	
	if (glow_mode == 0) {
		glow_alpha = 0;	
	}
	if (t == 0)
	{
		audio_play(nova_strike_sound);
		audio_stop(hover_sound);
		player_activate_immunity(immunity_types.normal);
	}
	
	if (t >= 0 && t <= 10)
	{
		animation_play("nova_strike", t);
		var result = move_x(dir, false);
		v_speed = -1.5;
		if (!result) {
			t = nova_strike_limit;
		}
	}
	
	if (t == 10)
	{
		special_inst = instance_create_depth(x, y, depth, nova_strike_object);
		nova_strike_move = true;
	}
	if (t >= 11 && t <= nova_strike_limit)
	{
		if (!nova_strike_move)
		{
			t = nova_strike_limit;
		}
		else {
			nova_strike_move = move_x(nova_strike_hspeed * dir);
		}
		
		if (instance_exists(special_inst))
		{
			special_inst.x = x;
			special_inst.y = y;
		}
	}

	if (t >= nova_strike_limit)
	{	
		if (state_timer < 20 && state_timer != t + 1)
		{
			audio_stop(nova_strike_sound);	
		}
		player_state_set(states.fall, 0);
		animation_play("fall");
		
		if (is_on_floor())
		{
			player_counters_reset();
			player_state_set(states.idle, 0);
			animation_play("idle");
		}
		special_inst = instance_try_destroy(special_inst);
	}

	dash_tapped = false;
	player_charge_reset();

	if (state != states.nova_strike)
	{
		charge_enabled = true;
		using_special_weapon = false;
		immunity = false;
	}


}
