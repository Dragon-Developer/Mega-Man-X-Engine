function player_state_saber_normal() {
	var t = state_timer++;
	var st = state;

	// Attacking
	if (substates[0] == 0) {
		// State Properties
		saber_atk_current = saber_atk;
	
		// First Frame
		if (t == 0) {
			if (move != 0) dir = move;
			xscale = dir;	
			audio_play(saber_atk_sound);
			animation = "";
			voice_play(state + saber_atk);
		}
		if (t < 10)
			animation_play(saber_atk_animation);
		// Do next attack after the animation is done
		if (t > 3 && saber_key_p)
			saber_atk_next = true;
		
		if (t == saber_projectile_frame && saber_projectile != noone) {
			player_shoot_projectile(saber_projectile);	
		}
		
		var do_next_combo = false;

		if (saber_atk_next && t >= 8 &&
		(saber_atk != noone && saber_atk < saber_atks.atk3 && saber_atk_unlocked[saber_atk + 1]))
			do_next_combo = true;
	
		// Action Scripts
		player_check_dash();
		player_check_jump();

		if (animation_end && animation == saber_atk_animation)
			substates[0] = 1; // End

		var cancel_attack = (state != st) || key_p_jump || !is_on_floor();

		if (cancel_attack || animation_end || do_next_combo) {
			state_timer = 0;
			if (do_next_combo && !cancel_attack) {
				if (saber_atk < saber_atks.atk3) {
					saber_atk++;
					saber_atk_animation = saber_atk_animations[saber_atk];
					saber_atk_sound = saber_atk_sounds[saber_atk];
					substates[0] = 0;
				}
			}
			else {
				if (!cancel_attack) {
					saber_end_animation = saber_atk_animation + "_end";
					animation_play(saber_end_animation);
				}
				saber_atk = noone;
			}
			saber_atk_next = false;
		}
	}
	// End
	else {
		if (animation_end) 
			player_check_idle();
		// Action Scripts
		player_check_crouch();
		player_check_walk();
		player_check_dash();
		player_check_jump();
	}
	player_check_fall();
	if (saber_atk != noone)
		saber.shot_level = saber_atk;
	if (state != st) {
		saber_state = noone;
		shoot_wait = false;
	}



}
