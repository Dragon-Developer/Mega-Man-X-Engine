function player_state_shin_messenko() {
	var t = state_timer++;
	
	if (t == 0) {
		player_activate_immunity(immunity_types.normal);
		shin_messenko_count = 0;
	}
	if (t < 26) {
		animation_play("shin_messenko", t);	
	}
	else {
		if (t == 26)  {
			audio_play(snd_player_punch_ground);
		}
		if (shin_messenko_count < shin_messenko_limit) {
			if ((t - 26) mod shin_messenko_interval == 0) {
				for (var d = -1; d <= 1; d += 2) {
					var inst = player_shoot_projectile(obj_player_zero_shin_messenko_spawn);
					inst.x += d * (0.5 + shin_messenko_count) * shin_messenko_distance;
					inst.y += shin_messenko_y_offset;
					inst.shake = (shin_messenko_count == 0 && d == -1);
					shots_count--;
				}
				shin_messenko_count += 1;
				shoot_update_position = false;
			}
		}
	}

	if (animation_end) {
		player_check_idle();
		player_check_fall();
		using_special_weapon = false;
		player_weapon_select(weapon_previous);
		current_weapon = noone;
	}

	player_charge_reset();
	player_saber_reset();

}
