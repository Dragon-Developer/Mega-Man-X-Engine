function player_state_death() {
	// Animation
	var t = state_timer++;
	dead = true;
	if (t == 0) {
		breath_enabled = false;
		pause_enabled = false;
		player_disable_speed_gear();
		animation_play("death");
		audio_stop(hover_sound);
		voice_play();
		using_special_weapon = false;
		v_speed = 0;
		h_speed = 0;
		visible = true;
		blink = false;
		blink_t = 0;
		player_effects_reset();
		player_saber_reset();
		player_dolor_reset();
		player_charge_reset();
		plt_index = (weapon_allow_pallete) ? weapon_palettes[weapon[0]] : plt_index_default;
	}
	if (t >= 31) {
		visible = false;
		light = false;
	}
	switch (t) {
		// Light Palette
		case 30:
			light = true;
			break;
		// Orbs
		case 31:
		case 64:
		case 98:
		case 141:
		case 184:
			player_create_orbs(8);
			break;
		case 32:
			player_create_orbs(8, 360 / 16);
			break;
		// Sound
		case 34:
			audio_play(death_sound);
			break;
		// Stop Sound
		case 199:
			music_stop(1000);
			break;
		// Screen Transition
		case 92:
			var tran = transition_create(transition_types.fade_out);
			tran.color = c_white;
			tran.depth = layer_get_depth(layer_get_id("Camera")) - 400;
			tran.transition_limit = 120;
			tran.wait_timer = 60;
			break;
		case 226:
			var tran = transition_create(transition_types.fade_out, transition_get_ideal_depth());
			tran.color = c_black;
			tran.transition_limit = 30;
			tran.wait_timer = 70;
			audio_group_set_gain(audiogroup_default, 0, 1000 * tran.transition_limit / room_speed);
			break;
	}
	if (t == 327) {
		audio_stop_all();
		audio_group_set_gain(audiogroup_default, 1, 0);
		global.player_lives--;
		global.camera_shake = false;
		if (global.player_lives >= 0) {
			room_restart();
			with (obj_mobile_button_parent) {
				alarm[0] = true; // Restart Virtual Keys	
			}
		} else {
			global.player_lives = 2;
			room = rm_start_menu;
			global.start_menu_force_state = true;
			global.start_menu_state = menu_states.stage_select;
			global.checkpoint = false;
		}
	}
	v_speed = 0;
	h_speed = 0;
	grav = 0;

}
