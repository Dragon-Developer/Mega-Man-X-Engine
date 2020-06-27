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
}

if (hover)
{
	var t = hover_t++;
	
	if (t == 0)
	{
		animation_play("hover");	
		audio_play(hover_sound);
	}
	
	if (t >= 0 && t <= hover_length)
	{
		grav = 0;
		v_speed = 0;
		walk_speed = hover_speed;
	}
	
	var result = key_right - key_left;
	var condition = false;
	
	condition |= (result != 0 && !can_move_x(result * walk_speed));
	
	if (t > hover_length)
	{
		grav = gravity_default / 2;
		condition |= (hover_mode == 0);
	}
	
	condition |= (!key_jump && t) || is_on_floor();
	
	if (condition)
	{
		hover = false;
		hover_t = 0;
		
		jump_enabled = true;
		fall_enabled = true;
		dash_enabled = true;
		wall_jump_enabled = true;
		wall_slide_enabled = true;
	
		walk_speed = walk_speed_default;
		
		audio_stop_sound(hover_sound);
		
		if (!is_on_floor())
		{
			grav = gravity_default;
		}
	}
}