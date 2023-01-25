if (global.paused && global.pause_type != pause_types.boss_death) exit;
if (is_active && state != boss_states.death) {
	local_game_speed = global.game_world_speed;	
}
if (state == boss_states.death || !is_active) {
	local_game_speed = 1;
}
event_inherited();
distance_x = abs(nearest_player.x - x);
if (local_game_run_step || state == boss_states.death) {
	t = state_timer++;
	plt_index = 0;
	if (t == 1) {
		var p = attack_properties[? state];
		if (!is_undefined(p) && is_array(p)) {
			if (is_undefined(attack_energy[? state]))
				attack_energy[? state] = 1;
			attack_energy[? state] -= p[0];
			boss_attack_recover_energy(state);
		}
	}
	switch (state) {
		case boss_states.intro:
			// Play animation
			if (t == 0) {
				animation_play("intro");
				bar = instance_create_depth(0, 0, layer_get_depth(layer_get_id("Camera")) - 300, obj_player_bar);
				bar.owner = id;
				bar.bar_icon_sprite = spr_boss_bar_icon;
				bar.x_off = 295;
			}
			if (t == intro_limit) {
				// Fill health
				var inst = instance_create_depth(0, 0, depth, obj_pickup_handler);
				inst.target = id;
				inst.pickup_pause = false;
				inst.amount = max_hp;
				inst.time_per_unit = 2;
				inst.pickup_type = pickup_types.hp;
			}
			// Full Health
			if (hp == max_hp) {
				state_set(boss_states.idle);
				intro = false;
				play_theme = boss_battle_theme;
				floor_y = y;
				with (obj_player_parent) {
					locked = false;	
				}
				is_active = true;
			}
			break;
		case boss_states.idle:
			if (t == 0) {
				animation_play("idle");
			}
			if (t >= idle_time_to_turn) {
				look_at_player();
			}
			// Wait
			if (t >= idle_limit) {
				boss_choose_attack();
				if (y > floor_y + 8)
					state_set(floor_state, 0);
			}
			break;
		case boss_states.jump:
			// Play animation
			if (t == 0) {
				animation_play("jump");
				look_at_player();
			}
			// Set initial vertical speed, apply gravity
			if (t == jump_wait) {
				v_speed = -jump_strength;
				grav = gravity_default;
				if (jump_to_player) {
					h_speed = (distance_x) / (2 * abs(v_speed / grav)) * dir;
				}
			}
			// Starting to fall
			if (t > jump_wait && v_speed >= 0)
				state_set(boss_states.fall);
			break;
		case boss_states.fall:
			// Play animation
			if (t == 0) {
				animation_play("fall");
			}
			// Start land state
			if (!activate_collision && is_on_floor() && !is_on_ceil()) {
				state_set(boss_states.land);	
				h_speed = 0;
			}
			break;
		case boss_states.land:
			// Play animation
			if (t == 0)
				animation_play("land");
			// Go to idle state when the animation has ended
			if (animation_end)
				state_set(boss_states.idle);
			break;
		case boss_states.dash:
			if (t == 0)
				animation_play("dash");
			// Set Hspeed and Acceleration
			if (t == dash_wait) {
				h_speed = dir * dash_speed;
				h_acceleration = -dir * dash_friction;
			}
			var cancel = false;
			// Dash Bounce
			if (dash_bounce) {
				if (t > dash_wait) {
					if (h_speed != 0 && !can_move_x(h_speed)) {
						h_speed *= -1;
						h_acceleration *= -1;
						dir *= -1;
					}
					if (h_speed == 0) {
						cancel = true;
					}
				}
			} else if (t >= dash_wait + dash_limit) {
				cancel = true;
			}
			// Dash Cancel
			if (cancel) {
				h_speed = 0;
				h_acceleration = 0;
				state_set(boss_states.idle);
			}
			break;
		case boss_states.death:
			local_game_speed = 1;
			boss_death_x1();
			for (var i = 0; i < array_length(anim); i++) {
				anim[i] = false;	
			}
			global.camera_shake = false;
			trail_visible = false;
			break;
		default:
			event_user(1);
	}
}

if (state == boss_states.idle && intro) {
	state_set(boss_states.intro);
	look_at_player();
}
blocking = (ds_map_exists(shielded_states, state) && (t >= shielded_states[? state]));
xscale = -dir;
// Activate Collision
if (activate_collision) {
	through_walls = true;
	if (activate_collision_t >= activate_collision_limit) {
		through_walls = false;
		activate_collision = false;
	} else activate_collision_t++;
}

if (play_theme != "") {
	music_play(play_theme);
	play_theme = "";
}
if (!desperate && hp <= hp_desperate && !intro) {
	desperate = true;
	for (var i = 0; i < ds_list_size(desperate_attacks); i++) {
		var arr = desperate_attacks[| i];
		var atk_state = arr[0];
		var atk_prop = arr[1];
		attack_properties[? atk_state] = atk_prop;
	}
	idle_limit = idle_desperate_limit;
}
if (local_game_run_step) {
	trail_update();
}
if (sprite_exists(hitbox_sprite)) {
	mask_index = hitbox_sprite;
}