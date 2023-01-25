// Needs refactoring: avoid repeating code
function scr_keys_update() {
	if (global.running_replay) exit;
	if (os_type != os_android) {
		if (global.settings[1] == input_types.keyboard) {
			key_p_left = (!key_left && keyboard_check(global.key_left));
			key_left = keyboard_check(global.key_left);

			key_p_right = (!key_right && keyboard_check(global.key_right));
			key_right = keyboard_check(global.key_right);

			key_p_up = (!key_up && keyboard_check(global.key_up));
			key_up = keyboard_check(global.key_up);

			key_p_down =  (!key_down && keyboard_check(global.key_down));
			key_down = keyboard_check(global.key_down);

			key_p_jump =  (!key_jump && keyboard_check(global.key_jump));
			key_jump = keyboard_check(global.key_jump);

			key_p_dash = (!key_dash && keyboard_check(global.key_dash));
			key_dash = keyboard_check(global.key_dash);

			key_p_shoot = (!key_shoot && keyboard_check(global.key_shoot));
			key_shoot = keyboard_check(global.key_shoot);

			key_p_shoot2 =  (!key_shoot2 && keyboard_check(global.key_shoot2));
			key_shoot2 = keyboard_check(global.key_shoot2);

			key_p_special =  (!key_special && keyboard_check(global.key_special));
			key_special = keyboard_check(global.key_special);
	
			key_p_wp1 = (!key_wp1 && keyboard_check(global.key_weapon1));
			key_wp1 = keyboard_check(global.key_weapon1);
	
			key_p_wp2 = (!key_wp2 && keyboard_check(global.key_weapon2));
			key_wp2 = keyboard_check(global.key_weapon2);
		
			key_p_start = (!key_start && keyboard_check(global.key_start));
			key_start = keyboard_check(global.key_start);
		}
	} else {
		if (instance_exists(obj_mobile_btn_dpad)) {
			key_p_left = (!key_left && keyboard_check(global.key_left));
			key_left = keyboard_check(global.key_left);

			key_p_right = (!key_right && keyboard_check(global.key_right));
			key_right = keyboard_check(global.key_right);

			key_p_up = (!key_up && keyboard_check(global.key_up));
			key_up = keyboard_check(global.key_up);

			key_p_down =  (!key_down && keyboard_check(global.key_down));
			key_down = keyboard_check(global.key_down);
		}
	
		key_p_jump =  (!key_jump && keyboard_check(global.key_jump));
		key_jump = keyboard_check(global.key_jump);

		key_p_dash = (!key_dash && keyboard_check(global.key_dash));
		key_dash = keyboard_check(global.key_dash);

		key_p_shoot = (!key_shoot && keyboard_check(global.key_shoot));
		key_shoot = keyboard_check(global.key_shoot);

		key_p_shoot2 =  (!key_shoot2 && keyboard_check(global.key_shoot2));
		key_shoot2 = keyboard_check(global.key_shoot2);

		key_p_special =  (!key_special && keyboard_check(global.key_special));
		key_special = keyboard_check(global.key_special);
	
		key_p_wp1 = (!key_p_wp1 && keyboard_check_pressed(global.key_weapon1));
		key_wp1 = keyboard_check(global.key_weapon1);
	
		key_p_wp2 = (!key_p_wp2 && keyboard_check_pressed(global.key_weapon2));
		key_wp2 = keyboard_check(global.key_weapon2);
	}

	if (global.settings[1] == input_types.gamepad) {
		var d = 0.3, _press = false, check_directional = true;
		if (global.gp_movement) {
			_press = gamepad_axis_value(global.gp_id, gp_axislh) < -d;
			key_p_left = (!key_left && _press);
			key_left = _press;
			check_directional &= !_press;
		
			_press = gamepad_axis_value(global.gp_id, gp_axislh) > d;
			key_p_right = (!key_right && _press);
			key_right = _press;
			check_directional &= !_press;
		
			_press = gamepad_axis_value(global.gp_id, gp_axislv) < -d
			key_p_up = (!key_up && _press);
			key_up = _press;
			check_directional &= !_press;
		
			_press = gamepad_axis_value(global.gp_id, gp_axislv) > d;
			key_p_down =  (!key_down && _press);
			key_down = _press;
			check_directional &= !_press;
		}
		if (check_directional) {
			key_p_left = gamepad_pressed(global.gamepad_config[e_key.left]); 
			key_left = gamepad_hold(global.gamepad_config[e_key.left]); 

			key_p_right = gamepad_pressed(global.gamepad_config[e_key.right]); 
			key_right = gamepad_hold(global.gamepad_config[e_key.right]); 

			key_p_up = gamepad_pressed(global.gamepad_config[e_key.up]); 
			key_up = gamepad_hold(global.gamepad_config[e_key.up]); 

			key_p_down = gamepad_pressed(global.gamepad_config[e_key.down]); 
			key_down = gamepad_hold(global.gamepad_config[e_key.down]); 
		}
		key_p_jump = gamepad_pressed(global.gamepad_config[e_key.jump]); 
		key_jump = gamepad_hold(global.gamepad_config[e_key.jump]); 

		key_p_dash = gamepad_pressed(global.gamepad_config[e_key.dash]); 
		key_dash = gamepad_hold(global.gamepad_config[e_key.dash]); 

		key_p_shoot = gamepad_pressed(global.gamepad_config[e_key.shoot]); 
		key_shoot = gamepad_hold(global.gamepad_config[e_key.shoot]); 

		key_p_shoot2 = gamepad_pressed(global.gamepad_config[e_key.shoot2]); 
		key_shoot2 = gamepad_hold(global.gamepad_config[e_key.shoot2]); 

		key_p_special = gamepad_pressed(global.gamepad_config[e_key.special]); 
		key_special = gamepad_hold(global.gamepad_config[e_key.special]); 

		key_p_wp1 = gamepad_pressed(global.gamepad_config[e_key.weapon1]); 
		key_wp1 = gamepad_hold(global.gamepad_config[e_key.weapon1]); 
	
		key_p_wp2 = gamepad_pressed(global.gamepad_config[e_key.weapon2]); 
		key_wp2 = gamepad_hold(global.gamepad_config[e_key.weapon2]); 	
		
		key_p_start = gamepad_pressed(global.gamepad_config[e_key.start]); 
		key_start = gamepad_hold(global.gamepad_config[e_key.start]); 	
	}

	replay_record_update(id);
}
