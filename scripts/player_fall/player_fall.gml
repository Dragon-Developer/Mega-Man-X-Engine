// Colliding with the ground
if (is_on_floor(v_speed) && v_speed >= 0)
{
	player_fix_x_axis();
    if (v_speed > 0 && land_enabled)
    {
		if (animation != "land")
		{
			animation_play("land");
			audio_stop(land_sound);
			audio_play(land_sound);
			land = true;
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
if (!fall)
{
	fall_t = 0;
}

if (!jump && !is_on_floor(3) && fall_enabled)
{   
	fall = true;
}
else
{
	fall = false;	
}

if (fall)
{
	var t = fall_t++;
	if (t < 4 || animation != "fall") animation_play("fall", t);
}
// Land
if (!land_enabled || animation_on_end("land") || !is_on_floor())
{
	land = false;	
}
