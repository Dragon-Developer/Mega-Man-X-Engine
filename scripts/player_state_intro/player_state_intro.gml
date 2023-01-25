function player_state_intro() {
	var t = state_timer++;
	switch(substates[0]) {
		case 0:
			grav = 0;
			v_speed = 0;
	
			if (t == 0) {
				x = x_start;
				if (cam != noone)
					y = __view_get(e__VW.YView, cam.view_id);
				visible = true;
				animation_play("tp");
				audio_play(intro_sound);
			}
	
			if (y + 8 >= y_start) {
				move_down(8);
		
				if (is_on_floor()) {
					state_timer = 0;
					substates[0] = 1;
				}
			} else {
				y += 8;	
			}
		break;
		case 1:
			if (t == 0) {
				animation_play(intro_animation);
			}
	
			if (animation == intro_animation && animation_on_end(intro_animation)) {
				animation_play(intro_end_animation);
		
				if (intro_end_animation != "")
					audio_play(intro_end_sound);	
			}
	
			if (animation_on_end(intro_end_animation)) {
				player_state_set(states.idle, 0, [0]);
				shoot_enabled = true;
				charge_enabled = true;
				saber_enabled = true;
				weapon_can_change = true;	
				breath_enabled = true;
				pause_enabled = true;
			}
		break;
	}


}
