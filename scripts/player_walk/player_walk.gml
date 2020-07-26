move = key_right - key_left;
walk = false;
idle = true;

if (move != 0 && walk_enabled)
{
    if (!walk_ignore_dir) dir = move;
    
    image_xscale = dir;
    
    if (!walk_ignore_move)
    {
        var result = move_x(move * walk_speed);
		
        if (is_on_floor())
        {
            if (result)
			{
				walk = true;
				idle = false;
				animation_play("walk");
				walk_speed = walk_speed_default;
				player_counters_reset();
			}
			else
			{
				idle = true;
			}
			while (!is_place_free(x, y)) y -= 1;
			move_down();
            // For some reason, this fixed the bug on slopes
            if (v_speed > 0 && v_speed <= gravity_default) v_speed = 0;
        }
    }
}