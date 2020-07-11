if (!jump_enabled) exit;

iof = is_on_floor();

if (key_p_jump)
{
    if (iof && !jump)
    {
        v_speed = -jump_strength;
        jump = true;
        audio_play(jump_sound);
    }
}

if (jump)
{
	var t = jump_t++;
	
	if (jump_animation_enabled) animation_play("jump", t);
	
    if (!key_jump && v_speed < 0) v_speed = 0;
    
    if (v_speed >= 0)
	{
		jump = false;
		jump_t = 0;
	}
}
