function player_saber_check() {
	if (!saber_unlocked || !saber_enabled || state == states.dolor || state == states.death
		|| using_special_weapon || !instance_exists(saber)) exit;

	player_saber_key_check();

	// Activate Method
	var changed_atk = false;
	if (saber_atk == noone) {
		saber.shot_level = 0;
		if (saber_key_p) {
			changed_atk = true;
			// Normal
			if (is_on_floor()) {
				player_saber_select(saber_atks.atk1);
			} else {
				// Wall Slide
				if (state == states.wall_slide && substates[0] == 1) {
					player_saber_select(saber_atks.wall);
				}
				// Jump
				else {
					player_saber_select(saber_atks.jump);
					if (key_up)
						player_saber_select(saber_atks.spinning_jump);
				}
			}
		}
	}
	if (saber_atk < saber_atks.normal_length) {
		if (saber_key2_p) {
			changed_atk = true;
			// Normal
			if ((is_on_floor() || dash_air_count < dash_air_limit) && can_move_x(dir))
				player_saber_select(saber_atks.raikousen);
			if (is_on_floor()) {
				if (state == states.dash)
					player_saber_select(saber_atks.dash);
				if (key_up)
					player_saber_select(saber_atks.up);
			} else {
				if (key_down)
					player_saber_select(saber_atks.down);
			}
		}
	}
	if (changed_atk) {
		if (saber_atk != noone) {
			player_saber_use(saber_atk);
		}
	}
	if (saber_atk != noone) {
		saber.boss_damage = saber_skill_boss_damage[saber_atk_skill[saber_atk]];
		saber.shot_level = saber_atk;
	}


}

function player_saber_use(_saber_atk, _saber_projectile = noone) {
	saber_atk = _saber_atk;
	saber.shot_level = saber_atk;
	saber.boss_damage = saber_skill_boss_damage[saber_atk_skill[saber_atk]];
	saber_projectile = _saber_projectile;
	shoot_wait = false;
	saber_projectile_frame = saber_projectile_frames[saber_atk];
	player_charge_reset();
	saber_atk_animation = saber_atk_animations[saber_atk];
	saber_atk_sound = saber_atk_sounds[saber_atk];
	saber_atk_next = false;
	saber_state = saber_states[saber_atk];
	ceil_reset_vspeed = true;
	state_set(saber_state, 0, [0, 0, 0, 0, 0]);	
}