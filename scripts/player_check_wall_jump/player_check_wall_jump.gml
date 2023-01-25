function player_check_wall_jump() {
	if (key_p_jump) {
	    var condition = false;
	    var dir_new = dir;
    
	    if (!is_on_floor() && !is_on_ceil()) {
			var check_dir = jumpable_wall_dir();
			if (check_dir != 0) {
				if (!immortal) {
					if (spikes_meeting(x + check_dir * 9, y) && death_by_spike) {
						hp = 0;
						exit;
					}
				}
				condition = true;
				dir_new = check_dir;
			}
	    }
    
	    if (condition) {
	        dir = dir_new;
	        xscale = dir;
			state_set(states.wall_jump, 1);
			voice_play();
			animation = "";
			animation_play("wall_jump");
	        wall_jump_dir = dir;
			wall_jump_animation_enabled = true;
	        v_speed = 0;
	        grav = 0;
		
			walk_speed = walk_speed_default;
		    player_counters_reset();
		    audio_play(jump_sound);
        
		    if (is_on_ceil(wall_jump_strength))
				wall_jump_reset_gravity = true;
	    }
	}


}
