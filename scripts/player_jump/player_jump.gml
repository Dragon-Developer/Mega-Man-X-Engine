if (!jump_enabled) exit;

if (key_p_jump)
{
	var can_jump_air = (double_jump_unlocked
		&& dash_air_count < dash_air_limit 
		&& !is_on_floor()
		&& !place_meeting(x + 9, y, obj_square_parent)
		&& !place_meeting(x - 9, y, obj_square_parent));
	var can_jump_floor = is_on_floor() && !jump;
    if (can_jump_floor || can_jump_air)
    {
        v_speed = -jump_strength;
        jump = true;
        audio_play(jump_sound);
		
		if (can_jump_air) dash_air_count++;
    }
}

if (jump)
{
	var t = jump_t++;
	
	if (jump_animation_enabled && (animation != "jump")) animation_play("jump", t);
	
    if (!key_jump && v_speed < 0) v_speed = 0;
    
    if (v_speed >= 0)
	{
		jump = false;
		jump_t = 0;
	}
}
