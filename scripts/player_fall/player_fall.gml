// Colliding with the ground
if (is_on_floor(vspeed) && vspeed >= 0)
{
    if (vspeed > 0 && land_enabled)
    {
        animation_play("land");
        audio_play(land_sound);
    }
    gravity = 0;
    vspeed = 0;
    y = floor(y - 2);
    move_contact_solid(270, -1);
    walk_speed = walk_speed_default;
    player_counters_reset();
}
// Colliding with the ceiling
else if (is_on_ceil(vspeed) && vspeed < 0)
{
    y = ceil(y + 2)
    move_contact_solid(90, -1);
    vspeed = 0;
}
else
{
    // Limit maximum vertical speed
    if (vspeed >= vspeed_max) vspeed = vspeed_max;
}
// Fall Animation
if (!jump && !is_on_floor(2) && fall_enabled)
{   
    animation_play("fall");
}
