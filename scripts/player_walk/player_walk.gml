if (!walk_enabled) exit;

move = key_right - key_left;
walk = false;

if (move != 0)
{
    if (!walk_ignore_dir) dir = move;
    
    image_xscale = move;
    
    if (!dash && !walk_ignore_move)
    {
        var result = move_x(dir * walk_speed);
        if (is_on_floor())
        {
            if (result)
			{
				walk = true;
				animation_play("walk");
			}
			else
			{
				animation_play("idle");
			}
			
			move_down();
            // For some reason, this fixed the bug on slopes
            if (vspeed > 0 && vspeed <= gravity_default) vspeed = 0;
        }
    }
}
else
{
    if (is_on_floor() && animation != "land")
    {
        if (!dash && !dash_end) animation_play("idle");
    }
}
