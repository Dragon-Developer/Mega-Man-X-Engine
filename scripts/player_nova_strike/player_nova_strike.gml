if (!nova_strike_enabled) exit;

var change_state = -1;

if (nova_strike_unlocked && !nova_strike && key_p_special
&& can_move_x(dir) && dash_air_count < dash_air_limit)
{
	nova_strike = true;
	change_state = false;
	animation_play("nova_strike");
	dash_air_count++;
	
	if (wall_slide) image_xscale = dir;
}

if (nova_strike)
{
	var t = nova_strike_t++;
	grav = 0;
	v_speed = 0;

	if (t == 0)
	{
		audio_play(nova_strike_sound);
	}
	
	if (t >= 0 && t <= 10)
	{
		v_speed = -1.5;
		var result = move_x(dir);
		
		if (!result)
		{
			t = nova_strike_limit;
		}
	}
	
	if (t >= 11 && t <= nova_strike_limit)
	{
		var result = move_x(nova_strike_hspeed * dir);
		
		if (!result)
		{
			t = nova_strike_limit;
		}
	}

	if (t >= nova_strike_limit)
	{
		nova_strike = false;
		
		if (nova_strike_t < 20 && nova_strike_t != t + 1)
		{
			audio_stop(nova_strike_sound);	
		}
		
		nova_strike_t = 0;
		change_state = true;
		
		if (is_on_floor())
		{
			player_counters_reset();	
		}
	}
	
	if (change_state > -1)
	{
		idle_enabled = change_state;
		walk_enabled = change_state;
		dash_enabled = change_state;
		jump_enabled = change_state;
		land_enabled = change_state;
		fall_enabled = change_state;
		wall_slide_enabled = change_state;
		wall_jump_enabled = change_state;
		shoot_enabled = change_state;
		charge_enabled = change_state;
		hadouken_enabled = change_state;
		walk_ignore_dir = !change_state;
		walk_ignore_move = !change_state;
		charge_enabled = change_state;
		dash = false;
		dash_tap = false;
		wall_slide = false;
		charge_level = -1;
		shoot = false;
	}
}