if (!jump_enabled) exit;

if (key_p_jump)
{
    if (is_on_floor() && !jump)
    {
        vspeed = -jump_strength;
        jump = true;
        animation_play("jump");
        audio_play(jump_sound);
    }
}

if (jump)
{
    if (!key_jump && vspeed < 0) vspeed = 0;
    
    if (vspeed >= 0) jump = false;
}
