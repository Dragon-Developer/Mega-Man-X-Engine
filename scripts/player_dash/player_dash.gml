if (!dash_enabled) exit;

// Starting Dash
if (!dash && dash_unlocked)
{
    // Double Tap
    var _result = key_p_right - key_p_left;
	var result = key_right - key_left;
	
    var start_dash = false;
    
    if (_result != 0)
    {
        if (dash_tap_dir == _result)
        {
            start_dash = true;
            dash_tap = false;
            dash_tap_t = 0;
        }
	}
    if (_result != 0 && result != 0 && result != dash_tap_dir)
    {
        dash_tap = true;
        dash_tap_t = 0;
        dash_tap_dir = _result;
    }
    
    if (dash_tap)
    {
        if (dash_tap_t > dash_tap_limit)
        {
            dash_tap = false;
            dash_tap_t = -1;
            dash_tap_dir = 0;
        }
        dash_tap_t++;
    }
    
    // Dash Key Pressed or Double Tap
    if (key_p_dash || start_dash)
    {
        var new_dash_dir = dir;
        var result = key_right - key_left;
        
        if (result != 0) new_dash_dir = result;
        
        if (can_move_x(dash_speed * new_dash_dir))
        {
            if ((is_on_floor() && !jump) || (dash_air_unlocked && dash_air_count < dash_air_limit))
            {
                dash = true;
                dash_t = 0;
                dash_dir = new_dash_dir;
                dir = dash_dir;
                image_xscale = dir;
                dash_tap_dir = 0;
                dash_tapped = start_dash;
                dash_air = !is_on_floor();
            }
        }
        start_dash = false;
    }
}

// Dash
if (dash)
{
    var t = dash_t;
    var condition_to_end = (t == dash_length + 1 || (key_p_jump && is_on_floor()));
    
    if (t == 0)
    {
        // Play Audio
        audio_play(dash_sound);
        
		idle_enabled = false;
		walk_enabled = false;
		
        if (dash_air)
        {
            dash_air_count++;
            jump = false;
            fall_enabled = false;
            jump_enabled = true;
            wall_jump = false;
            wall_jump_t = 0;
            dash_length = dash_air_length;
            wall_jump_reset_gravity = false;
            v_speed = 0;
        }
        else dash_length = dash_normal_length;
    }
    
    if (t >= 0 && t <= dash_length)
    {
        // Animation
        if (is_on_floor() || dash_air) animation_play("dash");
        
        // Gravity
        if (dash_air) grav = 0;
		
    }
    // Dash Spark
    if (t == 1)
    {
        dash_spark_inst = player_effect_create(dash_spark);
    }
    // Dash Movement
    if (t >= 1 && t <= dash_length)
    {
        if (!move_x(dash_speed * dash_dir) || (!is_on_floor() && !dash_air)) condition_to_end = true;
        
		// Dash Dust
		if (instance_exists(dash_dust) && dash_dust.script != noone)
		{
			script_execute(dash_dust.script);	
		}
    }
    // Dash Spark - Reset Relative Position
    if (t == 1 || t == 2) player_effect_pos_reset(dash_spark_inst);
    
    var result = key_right - key_left;
    
    if (!dash_tapped)
    {
        if (!key_dash) condition_to_end = true;
    }
    else if (result != dash_dir) condition_to_end = true;
    
    if (result != 0 && result != dash_dir) condition_to_end = true;
    
    if (condition_to_end && t <= dash_length + 2)
    {
        dash_end = true;
        dash_t = dash_length + 3;
        dash_spark_inst = player_effect_destroy(dash_spark_inst);
        walk_enabled = true;
        wall_jump_enabled = true;
        wall_slide_enabled = true;
        
        if ((key_p_jump && is_on_floor()) || !is_on_floor())
        {
			walk_speed = dash_speed;
            if (is_on_floor())
            {
                dash = false;
                dash_t = -1;
                dash_end = false;
                dash_end_t = 0;
				idle_enabled = true;
                fall_enabled = true;
                dash_air_count = 1;
            }
            
            dash_tapped = false;
            dash_tap = false;
        }
        
        if (!key_p_jump && is_on_floor(3))
        {
            walk_speed = walk_speed_default;
            v_speed = 0;
            move_down();
            player_counters_reset();
        }
        
    }
    dash_t++;
}

// Dash End
if (dash_end)
{
    var t = dash_end_t;
	
	if (is_on_floor()) walk_speed = walk_speed_default;    
    
	if (t <= 6 && (is_on_floor(3) || dash_air)) animation_play("dash_end");
    
    if (t >= 7 || (key_left ^^ key_right) || key_p_dash)
    {   
        dash = false;
        dash_t = 0;
        dash_end = false;
        dash_end_t = -1;
        dash_tapped = false;
        dash_tap = false;
        
        if (dash_air && !jump && !is_on_floor(3))
		{
			animation_play("fall", 10);
			fall = true;
		}
        dash_air = false;
        idle_enabled = true;
		fall_enabled = true;
    }
    
    if (key_p_dash)
    {
        if (is_on_floor() || dash_air_count < dash_air_limit)
        {
            dash = true;
            dash_tap_dir = dir;
            dash_air = !is_on_floor();
            fall_enabled = false;
        }
    }
    dash_end_t++;
}
