if (!dash_enabled) exit;

// Starting Dash
if (dash_unlocked)
{
    // Double Tap
    var _result = key_p_right - key_p_left;
	var result = key_right - key_left;
    var start_dash = false;
    
    if (_result != 0 && dash_tap_dir == _result)
    {
        start_dash = true;
        dash_tap = false;
        dash_tap_t = 0;
	}
    if (_result != 0 && result != 0 && result != dash_tap_dir || key_p_down)
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
	else
	{
		dash_tap_t = 0;	
		dash_tap_dir = 0;
	}
    
    // Dash Key Pressed or Double Tap
    if (key_p_dash || start_dash)
    {
        var new_dash_dir = dir;
        var result = key_right - key_left;
        
        if (result != 0) new_dash_dir = result;
        
		if ((!dash_up_unlocked || !key_up || start_dash || is_on_floor()) &&
		(can_move_x(dash_speed * new_dash_dir)) &&
		((is_on_floor() && !jump) || (dash_air_unlocked && dash_air_count < dash_air_limit)) &&
		(!dash_end || (dash_end && (result != 0 || dash_up))) &&
		(!dash_tapped || (dash_tapped && result != dash_dir && key_p_dash)) &&
		(!start_dash || (start_dash && (new_dash_dir != dash_dir || !dash))))
		{
			dash = true;
			dash_t = 0;
			dash_dir = new_dash_dir;
			dir = dash_dir;
			image_xscale = dir;
			dash_tap_dir = 0;
			dash_tapped = start_dash;
			dash_air = !is_on_floor();
			dash_up = false;
			dash_end = false;
		}
		else if ((dash_up_unlocked && key_up && !wall_slide) &&
		(!is_on_ceil() && !iof && (dash_air_count < dash_air_limit)) &&
		(!dash_end || (dash_end && !dash_up)))
		{
			dash = true;
			dash_t = 0;
			dash_dir = dir;
			image_xscale = dir;
			dash_air = true;
			dash_up = true;
			dash_end = false;
		}
        start_dash = false;
    }
}

// Dash (Horizontal)
if (dash)
{
	var t = dash_t++;
	
	if (!dash_up)
	{
	    var condition = (t == dash_length + 1 || (key_p_jump && is_on_floor()));
    
	    if (t == 0)
	    {
	        // Play Audio
	        audio_play(dash_sound);
		
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
	        if (iof || dash_air) animation_play("dash");
        
	        // Gravity
	        if (dash_air) grav = 0;
			
			idle_enabled = false;
			walk_enabled = false;
			fall_enabled = false;
		
	    }
	    // Dash Spark
	    if (t == 1)
	    {
	        dash_spark_inst = player_effect_create(dash_spark);
	    }
	    // Dash Movement
	    if (t >= 1 && t <= dash_length)
	    {
	        if (!move_x(dash_speed * dash_dir) || (!is_on_floor() && !dash_air)) condition = true;
        
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
	        condition |= !key_dash;
	    }
	    else condition |= (result != dash_dir);
    
	    condition |= (result != 0 && result != dash_dir);
    
	    if (condition && t <= dash_length + 2)
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
	                dash_t = 0;
	                dash_end = false;
	                dash_end_t = 0;
					idle_enabled = true;
	                fall_enabled = true;
	            }
			
				dash_air_count++;
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
	}
	else
	{
		var condition_to_end = (t == dash_length + 1 || (key_p_jump && is_on_floor()) || !key_dash);
	
		if (t == 0)
		{
			dash_length = dash_up_length;
		    dash_air_count++;
		    jump = false;
		    fall_enabled = false;
			walk_enabled = false;
		    jump_enabled = true;
		    wall_jump = false;
		    wall_jump_t = 0;
		    wall_jump_reset_gravity = false;
			wall_slide_enabled = false;
			wall_slide = false;
		    v_speed = 0;
		}
	
		if (t == 16)
		{
			dash_spark_inst = player_effect_create(dash_up_spark);
		}
	
		if (t >= 0 && t <= dash_length)
		{
			animation_play("dash_up");
			grav = 0;
			v_speed = 0;
		}
	
		if (array_contains([1, 3, 7, 9, 11, 13, 15, 16], t))
		{
			condition_to_end |= !move_contact_block(0, -1);
		}
	
		if (t == 19)
		{
			audio_play(dash_sound);	
		}
	
		if (t >= 19 && t <= 20)
		{
			condition_to_end |= !move_contact_block(0, -2);
		}
	
		if (t >= 21 && t <= dash_length)
		{
			condition_to_end |= !move_contact_block(0, -5);
		}
	
		if (condition_to_end)
		{
			dash_end = true;
			walk_enabled = true;
			wall_jump_enabled = true;
		    wall_slide_enabled = true;
		
			dash_t = dash_length + 2;
		
			walk_speed = dash_speed;
			player_effect_destroy(dash_spark_inst);
		}
	}
}
// Dash End
if (dash_end)
{
    var t = dash_end_t++;
	
	if (is_on_floor()) walk_speed = walk_speed_default;    
    
	if (!dash_up)
	{
		if (t <= 6 && (is_on_floor(3) || dash_air)) animation_play("dash_end");
	}
	else
	{
		animation_play("dash_up_end")
	}
	
    if (t >= 7 || (key_left ^^ key_right) || key_p_dash || (key_p_jump && iof))
    {   
        dash = false;
        dash_t = 0;
        dash_end = false;
        dash_end_t = 0;
        dash_tapped = false;
        dash_tap = false;
		dash_up = false;
        
        if (dash_air && !jump && !is_on_floor(3))
		{
			animation_play("fall", 10);
			fall = true;
		}
        dash_air = false;
        idle_enabled = true;
		fall_enabled = true;
		walk_enabled = true;

    }
}