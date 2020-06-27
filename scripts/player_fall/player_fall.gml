// Colliding with the ground
if (is_on_floor(v_speed) && v_speed >= 0)
{
    if (v_speed > 0 && land_enabled)
    {
		if (animation != "land")
		{
			animation_play("land");
			audio_play(land_sound);
		}
	}
    grav = 0;
    v_speed = 0;
	if (is_place_free(x, y - 2))
	{
		y = floor(y - 2);
	}
	//move_contact_block(0, 10);
	move_down(10);
	walk_speed = walk_speed_default;
    player_counters_reset();
}
// Colliding with the ceiling
else if (is_on_ceil(v_speed) && v_speed < 0)
{
	if (is_place_free(x, y + 2))
	{
		y = floor(y + 2);
	}
	move_contact_block(0, -10);
    v_speed = 0;
}
else
{
    // Limit maximum vertical speed
    if (v_speed >= vspeed_max) v_speed = vspeed_max;
}
// Fall Animation
if (!jump && !is_on_floor(3) && fall_enabled)
{   
	fall = true;
    animation_play("fall");
}
