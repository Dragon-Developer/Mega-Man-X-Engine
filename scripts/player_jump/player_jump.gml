if (!jump_enabled) exit;

if (key_p_jump)
{
    if (is_on_floor() && !jump)
    {
        v_speed = -jump_strength;
        jump = true;
        animation_play("jump");
        audio_play(jump_sound);
    }
}

if (jump)
{
    if (!key_jump && v_speed < 0) v_speed = 0;
    
    if (v_speed >= 0) jump = false;
}
