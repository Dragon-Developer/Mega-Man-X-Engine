function player_state_fly() {
	var t = state_timer++;

	// Start
	animation_play("fly");
	if (t == 0) {
		audio_play(hover_sound, true);
		dash_air_count++;
		player_effects_reset();
		special_inst = instance_try_destroy(special_inst);
	}
	if (!instance_exists(special_inst)) {
		special_inst = instance_create_depth(x, y, 0, obj_player_x_fly_falcon);
	}

	special_inst.x = x + h_speed;
	special_inst.y = y + v_speed;

	//player_activate_immunity(immunity_types.normal);

	grav = 0;
	v_speed = 0;
	var y_result = key_down - key_up;
	y_result = (is_place_free(x, y + 2 * y_result) ? y_result : 0);

	shoot = false;
	shoot_t = 0;
	shoot_enabled = true;
	// Animation
	if (t <= 6)
		animation_i = 0;
	else
		animation_i = 2 + y_result;

	// Vertical Small Movement
	if (t >= 7)	{
		if (y_result == 0) {
			fly_vertical_t++;
			var _limit = fly_vertical_limit;
			if (move != 0 || key_up || key_down)
				_limit = _limit div 2;
			if (fly_vertical_t > _limit) {
				fly_vertical_dir *= -1;
				fly_vertical_t = 0;
			}
			var sp = (fly_vertical_speed * fly_vertical_dir);
			if (is_place_free(x, y + sp))
				y += sp;
		} else {
			var sp = (fly_hspeed * y_result);
			v_speed = sp;
		}
	}
	
	if (t >= 7 && t <= fly_length) {
		walk_speed = fly_hspeed;
		player_check_move();
	}

	// Top Effect
	if (t == 7)
		effect_top_t = 0;
	if (t >= 7 && fly_effect != noone)
		player_effect_top(fly_effect, fly_effect_speed, fly_effect_limit, animation_i - 1);
	// Bottom Effect
	player_effect_bottom(fly_effect2, fly_effect2_speed, fly_effect2_limit, animation_i);

	// Blink
	if (t >= 7)
		effect_top_visible = (t mod 3 > 0);

	// Cancel
	var condition = false;

	if (t > fly_length)
		condition = true;
	
	condition |= (key_p_jump);
	
	if (condition) {
		player_state_set(states.idle, 0);
		animation_play("idle");	
	
		walk_speed = walk_speed_default;
		
		if (!is_on_floor()) {
			grav = gravity_default;
			player_state_set(states.fall, 0);
			animation_play("fall");
		} else {
			move_down();	
		}
	}

	// Changed State
	if (state != states.fly) {
		audio_stop_sound(hover_sound);	
		player_effects_reset();
		instance_try_destroy(special_inst);
	}


}
