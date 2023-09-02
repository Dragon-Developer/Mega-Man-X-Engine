function player_state_giga_crush() {
	var t = state_timer++;

	// State Properties
	grav = 0;
	v_speed = 0;
	h_speed = 0;
	using_special_weapon = true;
	shoot_wait = true;
	player_charge_reset();
	player_activate_immunity(immunity_types.normal);
	player_effects_reset();

	// Start Animation
	if (t == 0)
		animation_play("giga_crush");

	if (t == 2)
		player_effect_create(giga_crush_lines);
	if (t >= 1 && t <= 27) {
		if (t >= 3 && can_move_x(dir/4))
			x += dir/4;
		if (!is_on_ceil(1/2))
			y -= 1/2;
	}
	// Pause everything except the player
	if (t == 28) {
		pause_set(true, pause_types.special_attack);
		audio_play(snd_player_x_giga_crush);
		with (obj_surface) {
			drawing_layers_on_surfaces = true;
			player_inst = other;
			black_animation = 1;
		}
		draw_on_surface = true;
	}
	var surf_inst = obj_surface;
	// Screen Effect Animation
	// Colors
	if (t >= 31) {
		var len = array_length(giga_crush_rgb_array)
		if (t - 31 < len)
			screen_color_set(giga_crush_rgb_array[t - 31]);
		else if (t - 31 == len) {
			screen_color_set(255, 255, 115);	
		}
		if (t == 110) {
			screen_color_set(255, 255, 255);
		}
		if (t == 140) {
			screen_color_reset();	
		}
	}

	// Close Circle
	var max_radius = global.view_width / 2;
	if (t == 32)
		surf_inst.black_radius = max_radius;	
	if (t > 32 && t <= 39)
		surf_inst.black_radius -= (max_radius - (84 - 39)) / (39 - 32);	
	else if (t > 39 && t <= 84)
		surf_inst.black_radius -= 1;
	// Line
	if (t == 95) {
		surf_inst.black_radius = 0;	
		surf_inst.black_animation = 2;
	}
	if (t > 94 && t < 120) {
		surf_inst.black_radius = min(2*max_radius, surf_inst.black_radius + max_radius / (102 - 94));
	}
	// White Circle + Black Circle
	if (t == 120) {
		surf_inst.black_radius = 0;
		surf_inst.black_animation = 3;
	}
	if (t > 120 && t <= 128) {
		surf_inst.black_radius += max_radius / (128 - 120);	
	}
	// Rectangle
	if (t == 129) {
		surf_inst.black_radius = 0;
		surf_inst.black_animation = 4;
	}
	if (t > 129 && t < 142) {
		var tt = t - 128;
		surf_inst.black_radius += 2.05*tt
	}

	if (t == 129)
		pause_set(false);
	
	if (t == 142) {
		surf_inst.drawing_layers_on_surfaces = false;
		surf_inst.black_animation = 0;
		surface_draw_set_objects([par_tile, obj_door, par_destructibleobject, par_enemy], false);
		tilemap_layer_set_visible(true);
		background_layer_set_visible(true);
		draw_on_surface = false;
		ignore_draw = false;
		visible = true;
	}
	// Lines
	if (t mod 2 == 0 && t >= 120 && t <= 132) {
		repeat(2) {
			var _x = 0, _y = __view_get(e__VW.YView, 0) + irandom_range(1, 45) * 5, is_ok;
			do {
				_x = __view_get(e__VW.XView, 0) + irandom_range(1, 63) * 5;
				is_ok = true;
				for (var i = 0; i < instance_number(giga_crush_after_lines.object); i++) {
					var obj = instance_find(giga_crush_after_lines.object, i);
					if (obj.x == _x) {
						is_ok = false;
						break;	
					}
				}
			} until (is_ok);
			var inst = player_effect_create(giga_crush_after_lines);
			if (instance_exists(inst)) {
				with (inst) {
					x = _x;
					y = _y;
					image_index = irandom(2);
					switch (image_index) {
						case 0: v_speed = -10; break;
						case 1: v_speed = -5; break;
						case 2: v_speed = -3; break;
					}
					depth -= 300;
					animation_update(true);
				}
			}
		}
	}
	// Create Projectiles
	if (t == shoot_at_time) {
		player_shoot_projectile(shoot_next_projectile);
	}

	if (t > shoot_limit) {
		player_check_idle();
		if (!is_on_floor()) {
			animation_play("fall", 0);
			player_state_set(states.fall, 8);
		}
		using_special_weapon = false;
		shoot = false;
		shoot_wait = false;
		charge_enabled = true;
		immunity = false;
	}
}
