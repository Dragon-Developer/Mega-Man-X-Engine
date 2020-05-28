if (!wall_jump_enabled) exit;

// Start Wall Jump
if (key_p_jump)
{
    var condition = false;
    var dir_new = dir;
    
    if (!is_on_floor())
    {
        if (place_meeting(x + 9, y, obj_block_parent))
        {
            condition = true;   
            dir_new = 1;
        }
        
        if (place_meeting(x - 9, y, obj_block_parent))
        {
            condition = true;
            dir_new = -1;
        }
    }
    
    if (condition)
    {
        dir = dir_new;
        image_xscale = dir;
        wall_jump = true;
        wall_jump_t = 0;
        wall_jump_dir = dir;
        wall_slide = false;
        wall_slide_t = 0;
        dash_enabled = true;
        walk_ignore_move = false;
        walk_ignore_dir = false;
        jump = false;
        dash = false;
        dash_t = 0;
        dash_end = false;
        dash_end_t = 0;
        vspeed = 0;
        gravity = 0;
    }
}

// Wall Jump
if (wall_jump)
{
    var t = wall_jump_t;
    walk_enabled = false;
    wall_slide_enabled = false;
    fall_enabled = false;
    
    if (t == 0)
    {
        animation_play("wall_jump", 0);
        walk_speed = walk_speed_default;
        player_counters_reset();
        audio_play(jump_sound);
        
        if (is_on_ceil(wall_jump_strength)) wall_jump_reset_gravity = true;
    }
    
    if (t == 1) player_effect_create(wall_jump_spark);
	
    if (t <= 5)
    {
        gravity = 0;
        vspeed = 0;
        if (key_dash && dash_unlocked)
        {
            if (walk_speed != dash_speed) dash_air_count++;
            walk_speed = dash_speed;
        }
    }
    
    if (t == 6)
    {
        gravity = gravity_default;
        vspeed = -wall_jump_strength;
    }
    
    if (wall_jump_reset_gravity)
    {
        gravity = 0;
        vspeed = 0;
    }
    
    if (t >= 5 && t <= 11)
    {
        if (!is_on_ceil(3))
        {
            move_x(-wall_jump_dir * walk_speed);
        }
    }
    
    var condition_to_end = false;
    result = key_right - key_left;
    
    if (wall_jump_reset_gravity && (result == -wall_jump_dir))
    {
        condition_to_end = true;
    }
    
    if (t == 12 || condition_to_end)
    {
        wall_jump = false;
        wall_jump_t = -1;
        jump = true;
        animation_play("jump", 10);
        walk_enabled = true;
        wall_slide_enabled = true;
        fall_enabled = true;
        wall_jump_reset_gravity = false;
    }
    
    wall_jump_t++;
}
