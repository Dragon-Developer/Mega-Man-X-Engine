function player_state_outro() {
	var t = state_timer++;
	switch (substates[0]) {
		case 0:
			grav = 0;
			v_speed = 0;
			shoot_enabled = false;
			charge_enabled = false;
			breath_enabled = false;
			if (t == 0) {
				animation_play(outro_animation);
				audio_play(outro_sound);
				if (teleport_outro_reset_weapon) {
					player_weapon_select(weapon_list[0]);
				}
			}
	
			if (animation_end) {
				substates[0] = 1;
				state_timer = 0;
				y += outro_move_y;
				animation_play("tp");
				layer = layer_get_id("entities");
			}
		break;
		case 1:
			through_walls = true;
			grav = 0;
			v_speed = 0;
			y -= 8;
			if (t == 84){
				var tran = transition_create(transition_types.fade_out, transition_get_ideal_depth());
				tran.color = c_black;
				tran.transition_limit = 30;
				tran.wait_timer = 70;
				audio_group_set_gain(audiogroup_default, 0, 1000 * tran.transition_limit / room_speed);
		    }
			if (t == 184) {
				audio_stop_all();
				audio_group_set_gain(audiogroup_default, 1, 0);
				global.player_lives = max(global.player_lives, 2);
				room_goto(rm_start_menu);
				global.start_menu_force_state = true;
				global.start_menu_state = menu_states.stage_select;
				global.checkpoint = false;
			}
		break;
	}
}
