function player_state_dolor() {
	var t = state_timer++;
	
	if (t == 0) {
		//if we were actually hit, and not debugging
		hp -= dolor_damage;
		animation = "";
		animation_play(dolor_animation);
		audio_play(dolor_sound);
		if (hp > 0)
			voice_play();
		audio_stop(hover_sound);
		using_special_weapon = false;
		v_speed = 0;
		h_speed = 0;
		grav = 0;
		/*blink = false;
		blink_t = 0;
		immunity = false;
		immunity_t = 0;*/
		player_effects_reset();
		player_saber_reset();
		player_dolor_reset();
		visible = true;
	
		if (instance_exists(special_inst)) {
			instance_destroy(special_inst);
			special_inst = noone;
		}
		if (substates[0]) { 
			player_state_set(states.wall_slide);
			player_activate_immunity(immunity_types.dolor);
			exit;
		} else {
			xscale = dir;	
		}
	}
	
	if (t == 1) {
		if (dolor_jump)
			v_speed = -2;
		grav = gravity_default;
	}
	
	if (array_contains([3, 5, 7, 8, 10, 12, 14, 16, 18, 20, 21, 23, 25, 27, 29], t)) {
		move_x(-dir);
	}
	
	// Animation End
	if (animation_end) {
		player_state_set(states.fall, 8);
		animation_play("fall", 8);
		shoot_enabled = true;
		if (is_on_floor()) {
			player_state_set(states.idle, 0);
			animation_play("idle", 0);
		}
	
		player_activate_immunity(immunity_types.dolor);
		if (defense_shield_unlocked && defense_shield_enabled) {
			defense_shield_inst = instance_create_layer(x, y, layer_up, obj_player_defense_shield);
			defense_shield_inst.timer_limit = defense_shield_limit;
			defense_shield_inst.owner = self;
			defense_shield_inst.sprite_index = defense_shield_sprite;
		}
		defense_shield_enabled = true;
	}


}
