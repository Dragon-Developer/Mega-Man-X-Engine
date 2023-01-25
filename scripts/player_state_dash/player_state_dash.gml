function player_state_dash() {
	var t = state_timer++;
	dash_air = (substates[0] == 1);
	dash_up = (substates[1] == 1);
	dash_end = (substates[2] == 1);
	// Dash (Not End)
	if (!dash_end) {
		// Dash (Horizontal)	
		if (!dash_up) {
		    var condition = (t == dash_length + 1);
    
		    if (t == 0) {
		        // Play Audio
		        audio_play(dash_sound);
		
		        if (dash_air) {
		            dash_length = dash_air_length;
		            v_speed = 0;
		        } else {
					dash_length = dash_normal_length;
				}
		    }
    
		    if (t >= 0 && t <= dash_length) {
		        // Animation
		        if (is_on_floor() || dash_air)
					animation_play("dash");
        
		        // Gravity
		        if (dash_air) {
					grav = 0;
					v_speed = 0;
				}
				xscale = dir;
		
		    }
		    // Dash Spark
		    if (t == 1) {
		        dash_spark_inst = player_effect_create(dash_spark);
		    }
		    // Dash Movement
		    if (t >= 1 && t <= dash_length) {
		        if (!move_x(dash_speed * dash_dir) || (!is_on_floor() && !dash_air))
					condition = true;
        
				// Dash Dust
				if (instance_exists(dash_dust) && dash_dust.script != noone)
					script_execute(dash_dust.script);	
		    }
		    // Dash Spark - Reset Relative Position
		    if (t == 1 || t == 2)
				player_effect_pos_reset(dash_spark_inst);
    
		    var result = key_right - key_left;
    
		    if (!dash_tapped) {
		        condition |= !key_dash;
		    } else {
				condition |= (result != dash_dir);
			}
		    condition |= (result != 0 && result != dash_dir);
    
		    if (condition) {
		        dash_spark_inst = player_effect_destroy(dash_spark_inst);
		
		        if ((key_p_jump) || !is_on_floor()) {
					walk_speed = dash_speed;
			
		            if (is_on_floor()) {
						state_set(states.idle, 0);
						y_dir = 1;
		            } else {
						if (move != 0) {
							state_set(states.fall, 8);
							//dash_air_count++;
						} else {
							state_timer = 0;
							substates[2] = 1;
						}
					}

					dash_tapped = false;
		            dash_tap = false;
		        }
        
		        if (!key_p_jump && is_on_floor(3)) {
		            walk_speed = walk_speed_default;
		            v_speed = 0;
					substates[2] = 1;
					state_timer = 0;
		            move_down();
		            player_counters_reset();
		        }
        
		    }
		}
		// Dash (Vertical)
		else {
			var condition_to_end = (t == dash_length + 1 || (key_p_jump && is_on_floor()));
	
			if (!dash_tapped) {
		        condition_to_end |= !key_dash;
		    } else {
				condition_to_end |= !key_up;
			}
			if (t == 0) {
				dash_length = dash_up_length;
			    v_speed = 0;
				xscale = dir;
				animation = "";
			}
	
			if (t == 16)
				dash_spark_inst = player_effect_create(dash_up_spark);
	
			if (t >= 0 && t <= dash_length) {
				animation_play("dash_up");
				grav = 0;
				v_speed = 0;
			}
	
			if (array_contains([1, 3, 7, 9, 11, 13, 15, 16], t))
				condition_to_end |= !move_contact_block(0, -1);
	
			if (t == 19)
				audio_play(dash_sound);	
	
			if (t >= 19 && t <= 20)
				condition_to_end |= !move_contact_block(0, -2);
	
			if (t >= 21 && t <= dash_length)
				condition_to_end |= !move_contact_block(0, -5);
	
			if (condition_to_end) {
				// Dash End
				substates[2] = 1;
				state_timer = 0;
		
				walk_speed = dash_speed;
				player_effect_destroy(dash_spark_inst);
			}
		}
	}
	// Dash End
	else {
		player_check_move();
		if (is_on_floor())
			walk_speed = walk_speed_default;
	    // Horizontal
		if (!dash_up) {
			if (t <= 6 || is_on_floor(3) || dash_air) animation_play("dash_end");
		}// Vertical
		else {
			animation_play("dash_up_end")
		}
	
		if (t >= 7 || (key_left ^^ key_right)) {   
		    dash_tapped = false;
		    dash_tap = false;
			y_dir = 1;
		
			player_state_set(states.idle, 0);
			animation_play("idle", 0);
			if (!is_on_floor(3)) {
				player_state_set(states.fall, 8);
				animation_play("fall", 8);
			}
		
			substates[0] = 0;
			substates[1] = 0;
			substates[2] = 0;
		}
	}

	// Action Scripts
	player_check_walk();
	//if (!dash_end)
	player_check_dash();
	player_check_jump();
	player_check_wall_slide();
	player_check_wall_jump();
	player_check_dodge_roll();

	// Changed State
	if (state != states.dash) {
		dash_spark_inst = player_effect_destroy(dash_spark_inst);
		dash_tapped = false;
		y_dir = 1;
		if (key_down && crouch_unlocked)
			state_hitbox_current = state_hitbox[states.crouch];
	}
}
