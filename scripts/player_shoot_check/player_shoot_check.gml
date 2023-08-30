function player_shoot_check() {
	var _state = state;
	if (shoot_unlocked) {

		var condition = true;

		if (!charge_enabled || saber_state != noone) {
			charge = false;
			charge_t = 0;
			audio_stop_sound(charge_sound);
		}
		if ((state == states.dash && substates[1] == 1) // Dolor or Dash Up
		|| !shoot_enabled || shoot_wait || using_special_weapon || saber_state != noone || locked 
		|| state == states.z_buster_nightmare
		|| state == states.z_buster_x5
		)
			condition = false;

		var change_state = -1, change_state_type = shoot_types.normal;

		var key_p = false;
		var key_h = false;
		
		if (condition) {
			if (key_shoot && weapon[0] != noone && (current_weapon == noone || current_weapon == weapon[0])) {
				key_p = key_p_shoot;
				key_h = key_shoot;
				current_weapon = weapon[0];
			}

			if (key_shoot2 && weapon[1] != noone && (current_weapon == noone || current_weapon == weapon[1])) {
				key_p = key_p_shoot2;
				key_h = key_shoot2;
				current_weapon = weapon[1];
			}
		
			if (key_special && weapon[2] != noone && (current_weapon == noone || current_weapon == weapon[2])) {
				key_p = key_p_special;
				key_h = key_special;
				current_weapon = weapon[2];
			}
		}
		
		if (shots_count < 0)
			shots_count = 0;

		if (shoot_t >= shoot_limit) {
			shoot_wait = false;
		}
		//auto_charge = weapon_auto_charge[weapon[0]];
		if (auto_charge && !charge && charge_level <= 0 && shot_id == 0) {
			charge = true;
			charge_t = 0;
			charge_level = 0;
		}
		if (current_weapon != noone && condition) {
			if (key_p || (!key_h && charge && !auto_charge) || (key_h && weapon_hold_mode && !shoot_wait && !shoot_wait_press)) {	
				charge = false;
				charge_t = 0;
		
				if (shots_count < shots_limit && player_weapon_can_spend(current_weapon, charge_level)) {
					weapon_script = weapons_script[current_weapon];
		
					if (charge_level < 0)	
						charge_level = 0;
					if (weapon_level_id[current_weapon] != 0)
						shot_id = weapon_level_id[current_weapon];
					player_shoot(charge_level, shot_id);
					if (ds_queue_size(projectiles_queue) > 0) {
						shoot_t = 0;
						var tail = ds_queue_tail(projectiles_queue);
						if (state == states.dolor || state == states.fly) {
							with (tail) {
								instance_destroy();	
							}
							if (instance_exists(tail)) {
								ds_queue_dequeue(projectiles_queue);	
							}
						}
						else if (!instance_exists(tail) || !tail.ignore_cost) {
							player_weapon_spend(current_weapon, previous_charge_level);
						}
					}
					audio_stop(charge_sound);
				} else {
					if (!key_h)
						charge_level = 0;
				}
			}
		}

		if (!shoot) {
			if (key_h && !charge && charge_level <= 0 && charge_unlocked && charged_shots_count < charged_shots_limit) {
				charge = true;
				charge_t = 0;
			}	
		} else {
			var t = shoot_t++;
	
			if (t == 0 && shoot_animation == "" && shoot_next_animation != "") {
				shoot_animation = shoot_next_animation;
				shoot_projectile = shoot_next_projectile;
				shoot_type = shoot_next_type;
				shoot_wait = shoot_next_wait;
				shoot_next_animation = "";
			}
			if (shoot_type == shoot_types.no_animation) {
				t = shoot_limit + 1; 
			}
			else {
				if (shoot_animation != "") {
					animation = "";
					animation_play(shoot_animation, t);
		
					change_state = true;
					change_state_type = shoot_type;
		
					if (t == shoot_at_time) {
						if (shoot_projectile != noone)
							player_shoot_projectile(shoot_projectile);
						shoot_projectile = noone;
					}
				} else if (state != states.shoot_pistol) {
					if (array_contains([idle_animation, "shoot"], animation)) {
						if (t == 0)
							animation = "";
						animation_play("shoot", t);
					}
				}
			}
	
			if (t > shoot_limit) {
				if (shoot_next_animation != "") {
					shoot_animation = shoot_next_animation;
					shoot_type = shoot_next_type;
					change_state = true;
					change_state_type = shoot_type;
					shoot_projectile = shoot_next_projectile;
					shoot_wait = shoot_next_wait;
					shoot_next_animation = "";
				} else {
					shoot = false;
					change_state = false;
					change_state_type = shoot_type;
					shoot_animation = "";
					shoot_wait = false;
					shoot_next_wait = false;
					shoot_next_animation = "";
					shoot_type = shoot_types.normal;
				}
		
				shoot_t = 0;
			}
		}

		if (change_state > -1) {
			switch(change_state_type) {
				case shoot_types.super_shot:
					if (state != states.idle) {
						shoot_animation = "";
						shoot_limit = 16;	
						shoot_type = shoot_types.normal;
					}
					if (change_state && state == states.idle)
						animation_play("super_shoot", shoot_t - 1);	
					if (!change_state || shoot_animation == "")
						animation_play(idle_animation, state_timer);
				break;
				case shoot_types.super_shot_crouch:
					if (!key_down || state != states.crouch) {
						shoot_animation = "";
						shoot_limit = 16;
						shoot_type = shoot_types.normal;
					}
					if (change_state && state == states.crouch)
						animation_play("super_shoot_c", shoot_t - 1);
					if (!change_state || shoot_animation == "")
						animation_play("crouch", state_timer);
				break;
				case shoot_types.ceil_cling:
					if (state != states.ceil_cling) {
						shoot_animation = "";
						shoot_limit = 16;	
					}
					if (change_state && shoot_animation != "") {
						animation = "";
						animation_play(shoot_animation, shoot_t - 1);
					}
				break;
			}
		}
	}
	player_fix_pending_projectiles();
	player_charge();
	if (state != _state) {
		audio_stop_sound(hover_sound);
	}


}
