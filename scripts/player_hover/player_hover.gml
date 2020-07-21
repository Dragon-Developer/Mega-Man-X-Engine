if (!hover_enabled) exit;

if (!is_on_floor() && hover_unlocked && key_p_jump && dash_air_count < dash_air_limit)
{
	dash_air_count++;
	hover = true;
	jump_enabled = false;
	fall_enabled = false;
	dash_enabled = false;
	wall_jump_enabled = false;
	wall_slide_enabled = false;
	walk_ignore_dir = hover_keep_dir;
}

if (hover)
{
	var t = hover_t++;
	
	if (t == 0)
	{
		animation_play("hover");
		audio_play(hover_sound, true);
		if (hover_keep_dir) animation_i = 2;
	}
	
	if (hover_keep_dir)
	{
		var result = dir*(key_right - key_left);
		var desired_frame = 2 * (result + 1);
		var dif = desired_frame - animation_i;
		animation_i += sign(dif) * 0.25;
	}
	
	if (hover_vertical)
	{
		var tt = hover_vertical_t++;
		
		if (tt > hover_vertical_limit)
		{
			hover_vertical_dir *= -1;
			hover_vertical_t = 0;
		}
		y += hover_vertical_speed * hover_vertical_dir;
	}
	
	if (t >= 0 && t <= hover_length)
	{
		grav = 0;
		v_speed = 0;
		walk_speed = hover_speed;
	}
	
	if (hover_effect != noone)
	{
		var tt = hover_effect_t++;	
		hover_effect_i = floor(animation_i) * (hover_effect_limit + 1) + (tt * hover_effect_speed);
		
		if ((tt * hover_effect_speed) >= hover_effect_limit + 1)
		{
			hover_effect_t = 0;		
			hover_effect_i = floor(animation_i) * (hover_effect_limit + 1);
		}
	}
	
	var result = key_right - key_left;
	var condition = false;
	
	condition |= (result != 0 && !can_move_x(result * walk_speed));
	
	if (t > hover_length)
	{
		grav = gravity_default / 2;
		condition |= (hover_mode == 0);
	}
	
	condition |= ((!key_jump && !hover_toggle_mode) && t) || is_on_floor();
	condition |= (key_p_jump && hover_toggle_mode) && t;
	
	if (condition)
	{
		hover = false;
		hover_t = 0;
		
		jump_enabled = true;
		fall_enabled = true;
		dash_enabled = true;
		wall_jump_enabled = true;
		wall_slide_enabled = true;
		walk_ignore_dir = false;	
	
	
		walk_speed = walk_speed_default;
		
		audio_stop_sound(hover_sound);
		
		if (!is_on_floor())
		{
			grav = gravity_default;
		}
	}
}