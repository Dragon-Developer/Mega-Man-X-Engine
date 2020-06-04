move = key_right - key_left;
walk = false;
idle = true;

if (move != 0 && walk_enabled)
{
    if (!walk_ignore_dir) dir = move;
    
    image_xscale = move;
    
    if (!walk_ignore_move)
    {
        var result = move_x(dir * walk_speed);
		
        if (is_on_floor())
        {
            if (result)
			{
				walk = true;
				idle = false;
				animation_play("walk");
			}
			else
			{
				idle = true;
			}
			move_down();
            // For some reason, this fixed the bug on slopes
            if (v_speed > 0 && v_speed <= gravity_default) v_speed = 0;
        }
    }
}

if (idle && idle_enabled && is_on_floor() && animation != "land")
{
	animation_play("idle");	
}