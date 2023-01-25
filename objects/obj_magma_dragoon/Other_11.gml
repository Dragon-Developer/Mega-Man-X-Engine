enum magma_dragoon {
	jump_intro,
	land_intro,
	jump_edge,
	hadouken,
	shoryuken,
	shoryuken_fall,
	leg_attack,
	flame_bullet,
	flame_pillar,
	vomit_fire,
	fall,
	dive_kick,
	raging_demon
}
var animated_palette = false, land_effect = false, shoryuken_condition = false, kick_condition = false;
var dist_x = distance_x;
shoryuken_condition = boss_can_choose(magma_dragoon.shoryuken) && (dist_x < 64 || (dist_x < 196 && nearest_player.y < y));
kick_condition = (((nearest_player.y > y + 16) && dist_x < 240) && ((floor_y - y) > 100));
switch (state) {
	#region Jump Intro
	case magma_dragoon.jump_intro:
		// Palette
		animated_palette = true;
		anim[1] = !anim[1];
		anim_i[1] += 0.5;
		// Rise Up
		if (t < 66) {
			h_acceleration = 1/128 * dir;
			move_y(-2.5);
			v_speed = 0;
			grav = 0;
		} else if (t == 66) {
			v_speed = 0;
		} else {
			h_acceleration = 0;
			h_speed = 0.75*dir;
			grav = 0.125;
			if (is_on_floor()) {
				grav = 0;
				h_speed = 0;
				anim[1] = false;
				animation_play("land");
				state_set(magma_dragoon.land_intro, 0);
				land_effect = true;
				audio_play(snd_magma_dragoon_land);
			}
		}
		break;
	#endregion
	#region Land Intro
	case magma_dragoon.land_intro:
		if (animation_on_end("land") && t < 31) {
			animation_play("idle");	
		}
		if (t == 31) {
			animation_play("intro2");	
		}
		anim[0] = false;
		if (t <= 75)
			animated_palette = true;
		if (t >= 54 && t <= 75) {
			anim[0] = true;
			anim_i[0] = (t - 54) mod 4;
		}
		if (t > 70 && animation_on_end("intro2")) {
			anim[0] = false;
			var _x = x;
			border_right_x = x;
			while (is_on_floor()) {
				x -= 16;
			}
			border_left_x = x + 16;
			stage_mid_x = (border_right_x + border_left_x) / 2;
			x = _x;
			state_set(boss_states.intro);
			look_at_player();
		}
		break;
	#endregion
	#region Hadouken
	case magma_dragoon.hadouken:
		if (t == 0 && irandom(2) == 1 && shoryuken_condition) {
			state_set(magma_dragoon.shoryuken, 0, [0]);
			break;
		}
		var n = substates[0];
		var max_n = (desperate) ? 3 : 2;
		var crouched = (n + floor(x)) mod 2;
		var _c = (crouched) ? "_c" : "";
		
		// Palette Swap
		if (t == 0) {
			animation_play("hadouken1" + _c, 0);
			look_at_player();
		}
		if (t < 18)
			animated_palette = true;
		// Shoot
		if (t == 18) {
			animation_play("hadouken2" + _c, 0);
			boss_voice_play(snd_magma_dragoon_hadouken);
			// Create Projectile
			var _x = x + 16*dir, _y = y - 5;
			if (crouched) {
				_x = x + 18*dir;
				_y = y + 17;
			}
			var shot = instance_create_depth(_x, _y, depth - 5, obj_magma_dragoon_hadouken);
			shot.dir = dir;
			shot.xscale = xscale;
		}
		if (t == 62) {
			animation_play("land");	
		}
		// Repeat or Finish
		if (t == 67) {
			if (n + 1 < max_n) {
				state_set(state, 0, [n + 1]);
			} else {
				state_set(boss_states.idle);
				if (shoryuken_condition)
					state_set(magma_dragoon.shoryuken, 0, [0]);
			}
		}
		break;
	#endregion
	#region Vomit Fire
	case magma_dragoon.vomit_fire:
		if (t == 0 && irandom(1) == 1 && shoryuken_condition) {
			state_set(magma_dragoon.shoryuken, 0, [0]);
			break;
		}
		if (t == 0)
			look_at_player();
		if ((dir == 1 && x > border_right_x - 32) || (dir == -1 && x < border_left_x + 32)) {
			dir *= -1;
		}
		var t_limits = array_get([[0, 35, 95, 195], [0, 35, 50, 150], [0, 30, 45, 145]], global.difficulty);
		// Fire Palette
		if (t < t_limits[1])
			animated_palette = true;
		// Animation
		for (var i = 0; i < 4; i++) {
			if (t == t_limits[i]) {
				animation_play("vomit" + string(i + 1));
				break;
			}
		}
		// Create Projectile
		if (t > t_limits[2] && t <= t_limits[3]) {
			if (t mod 7 == 0) {
				var shot = instance_create_depth(x + 16*dir, y, depth - 5, obj_magma_dragoon_shot1);
				shot.h_speed = shot.abs_hspeed * dir;
				shot.dir = dir;
				shot.xscale = dir;
				audio_play(snd_magma_dragoon_fire);
			}
		}
		// Finish
		if (t == t_limits[3] + 22)
			state_set(boss_states.idle, 0);
		break;
	#endregion
	#region Shoryuken
	case magma_dragoon.shoryuken:
		var t_limits = [0, 8];
		// Fire Palette
		if (t == t_limits[0]) {
			animation_play("shoryuken1");
			look_at_player();
		}
		if (t < t_limits[1])
			animated_palette = true;
		else if (t == t_limits[1])
			animation_play("shoryuken2");
		else if (t == t_limits[1] + 1) {
			v_speed = -8;
			grav = gravity_default;
			boss_voice_play(snd_magma_dragoon_shoryuken);
			hitbox_inst = instance_create_depth(x, y, depth, obj_magma_dragoon_hitbox);
			hitbox_inst.owner = id;
		} else {
			anim_sprite[2] = spr_magma_dragoon_shoryuken;
			anim_sprite[3] = anim_sprite[2];
			anim_i[2] += 0.5;
			anim_i[3] = anim_i[2];
			anim[2] = (t mod 3 == 0);
			anim[3] = !anim[2];
			if (substates[0] == 0) {
				h_speed = -3/4 * v_speed * dir;
			}
			if (dist_x < 4) {
				h_speed = 0;
				substates[0] = 1;
			}
			if (v_speed >= 0) {
				state_set(magma_dragoon.shoryuken_fall, 0, [0]);
				anim[2] = false;
				anim[3] = false;
				with (hitbox_inst) {
					instance_destroy();
				}
				hitbox_inst = noone;
			}
		}
			
		break;
	#endregion
	#region Shoryuken Fall
	case magma_dragoon.shoryuken_fall:
		if (t == 0 && irandom(2) == 1 && kick_condition) {
			state_set(magma_dragoon.dive_kick);
			break;
		}
		if (t == 0)
			animation_play("shoryuken_fall");
		if (is_on_floor()) {
			grav = 0;
			land_effect = true;
			state_set(boss_states.land);
			audio_play(snd_magma_dragoon_land);
		}
		break;
	#endregion
	#region Jump to Edge
	case magma_dragoon.jump_edge:
		// Play animation
		if (t == 0) {
			animation_play("jump");
			boss_voice_play(snd_magma_dragoon_jump);
		}
		// Set initial vertical speed, apply gravity
		if (t == jump_wait) {
			grav = gravity_default;
			var dest_x = border_right_x;
			var h1 = choose(80, 128);
			if ((x > stage_mid_x || x < border_left_x) && (x < border_right_x + 16)) {
				dest_x = border_left_x;
			}
			if (x < border_left_x) {
				dest_x += 32;
				h1 = 80;
			}
			if (x > border_right_x) {
				dest_x -= 16;
				h1 = 80;
			}
			var d = dest_x - x; // Hor Distance
			var h2 = max(0, h1 + floor_y - y); // Max height relative to the player
			h_speed = d * sqrt(grav) / (sqrt(2) * (sqrt(h1) + sqrt(h2)));
			v_speed = -sqrt(2 * grav * h1);
			dir = 1;
			if (dest_x < x)
				dir = -1;
			land_effect = true;
		}
		// Starting to fall
		if (t > jump_wait && v_speed >= 0) {
			state_set(magma_dragoon.fall, 0, [0]);
		}
		break;
	#endregion
	#region Fall
	case magma_dragoon.fall:
		if (t == 0 && kick_condition && dir == sign(nearest_player.x - x)) {
			state_set(magma_dragoon.dive_kick, 0, [0]);
			break;
		}
		// Play animation
		if (t == 0) {
			animation_play("fall");
		}
		// Start land state
		if (is_on_floor() && !is_on_ceil()) {
			state_set(boss_states.land);	
			h_speed = 0;
			audio_play(snd_magma_dragoon_land);
			land_effect = true;
		}
		break;
	#endregion
	#region Dive Kick
	case magma_dragoon.dive_kick:
		animated_palette = true;
		// Play animation
		if (t == 0) {
			animation_play("shoryuken_fall");
			look_at_player();
		} else if (t == 7) {
			animation_play("kick");
			boss_voice_play(snd_magma_dragoon_kick);
			hitbox_inst = instance_create_depth(x, y, depth, obj_magma_dragoon_hitbox);
			hitbox_inst.mask_index = spr_magma_dragoon_kick;
			hitbox_inst.owner = id;
		} else if (t >= 9) {
			h_speed = 6*dir;
			v_speed = 5;
			anim_sprite[2] = spr_magma_dragoon_kick;
			anim_sprite[3] = anim_sprite[2];
			anim_i[2] += 0.5;
			anim_i[3] = anim_i[2];
			anim[2] = t mod 2;
			anim[3] = !anim[2];
		}
		if (t < 9) {
			v_speed = 0;
			h_speed = 0;
		}
		grav = 0;
		// Start land state
		if (is_on_floor() && !is_on_ceil()) {
			state_set(boss_states.land);	
			h_speed = 0;
			anim[2] = false;
			anim[3] = false;
			with (hitbox_inst) {
				instance_destroy();
			}
			hitbox_inst = noone;
			audio_play(snd_magma_dragoon_land);
			land_effect = true;
		}
		break;
	#endregion
	#region Flame Bullet
	case magma_dragoon.flame_bullet:
		var bullet_n = array_get([10, 22, 33], global.difficulty);
		anim_i[0] += 1;
		if (substates[1] == 0) {
			if (t == 0) {
				look_at_player();
				boss_voice_play(snd_magma_dragoon_scream);
				animation_play("vomit1");
			} else if (t == 13)
				animation_play("flame_bullet");
			if (t > 13) {
				animated_palette = true;
			}
			if (t >= 16) {
				anim[0] = true;
				if ((((t - 16) mod 4) == 0) && substates[0] < bullet_n) {
					var shot = instance_create_depth(x - 8*dir, y - 13, depth - 5, obj_magma_dragoon_shot2);
					shot.h_speed = random_range(-0.5, 0.5);
					audio_play(snd_magma_dragoon_fire);
					substates[0]++;
				}
				if (substates[0] >= bullet_n) {
					state_set(state, 0, [0, 1]);
				}
			}
		} else if (substates[1] == 1) {
			if (t >= 93) {
				global.camera_shake = true;
				if (((t - 93) mod 14) == 0) {
					var _x = irandom_range(G.camera_min_x + 100, G.camera_max_x + 100);
					var _y = G.camera_min_y - 48;
					var shot = instance_create_depth(_x, _y, depth - 5, obj_magma_dragoon_meteor);
					substates[0]++;
				}
				if (substates[0] >= bullet_n) {
					state_set(state, 0, [0, 2]);
				}
			}
		} else if (t > 60) {
			anim[0] = 0;
			anim_i[0] = 0;
			state_set(magma_dragoon.jump_edge, 0, [0, 0]);
			anim[0] = false;
			global.camera_shake = false;
		}
		break;
	#endregion
	#region Flame Pillar
	case magma_dragoon.flame_pillar:
		if (t == 0) {
			look_at_player();
			animation_play("pillar");
			boss_voice_play(snd_magma_dragoon_scream);
		}
		if (t == 4) {
			var shot = instance_create_depth(x, y - 64, depth - 5, obj_magma_dragoon_shot3);
			shot.dir = dir;
			shot.xscale = xscale;
			shot.limit_x = [border_left_x, border_right_x];
		}
		if (t >= 74) {
			state_set(boss_states.idle);	
		}
		break;
	#endregion
	#region Raging Demon
	case magma_dragoon.raging_demon:
		if (substates[0] == 0) {
			var t_limit = 24; //array_get([36, 24, 18], global.difficulty);
			if (grabbing_player) {
				state_set(state, 0, [1]);
				damageable = false;
				with (grab_player_inst) {
					animation_play("death");
					locked = true;
					player_charge_reset();
					player_saber_reset();
					saber_enabled = false;
					shoot_enabled = false;
				}
				break;
			}
			if (t == 0) {
				animation_play("raging");
				trail_visible = true;
				look_at_player();
				grab_player = true;
				boss_voice_play(snd_magma_dragoon_scream);
				anim_i[3] = 0;
			}
			anim_sprite[3] = spr_magma_dragoon_raging_effect;
			anim_i[3] += 18 / t_limit;
			anim[3] = (anim_i[3] <= 17);
			if (t == t_limit) {
				look_at_player();
				h_speed = dir * array_get([4.5, 4.5, 5], global.difficulty);
			}
			var _x = x + h_speed;
			if (((dir == 1 && _x > border_right_x + 8) || (dir == -1 && _x < border_left_x - 8)) || // It's on the edge or
			(t > 36 && (dir == 1 && x > nearest_player.x) || (dir == -1 && x < nearest_player.x))) { // it's not going towards the player
				state_set(boss_states.idle, 0, [0, 0]);
				grab_player = false;
				h_speed = 0;
				trail_visible = false;
				anim[3] = false;
			}
		} else {
			anim[3] = false;
			h_speed = 0;
			if (t == 0) {
				trail_visible = false;
				animation_play("raging2");
				grab_player_inst.y = y - 16;
				grab_player_inst.x = x + 20*dir;
				grab_player_inst.grab_wait = 30 + raging_wait;
				grab_player_inst.locked = true;
				depth = player_depth - 1;
				music_stop(((30 + raging_wait) / room_speed) * 1000);
			}
			if (t == 30) {
				var tran = transition_create(transition_types.transparency, camera_depth);
				tran.color = c_black;
				tran.alpha = 1;
				tran.transition_limit = raging_wait;
				audio_play(snd_magma_dragoon_raging);
			}
			if (t > 30 && t < 30 + raging_wait && t mod 4 = 0) {
				instance_create_depth(grab_player_inst.x + irandom_range(-20, 20), grab_player_inst.y + irandom_range(-20, 20), layer_get_depth(layer_get_id("Camera")) - 1, obj_magma_dragoon_raging);
			}
			if (t ==  30 + raging_wait) {
				depth = player_depth;
				var tran = transition_create(transition_types.transparency, depth + 1);
				tran.back_sprite = spr_magma_dragoon_raging_background;
				tran.back_speed = 1;
				tran.back_index = 0;
				tran.color = c_white;
				tran.transition_limit = 300;
				dir = -1;
				animation_play("raging3");
			}

		}
		break;
	#endregion
}

if (animated_palette)
	plt_index = 2 + (t mod 4 >= 2)
if (land_effect) {
	instance_create_depth(x, y, depth + 5, obj_magma_dragoon_landfire);
	instance_create_depth(x, y, depth - 5, obj_magma_dragoon_landfire2);
	instance_create_depth(x, y, depth + 10, obj_magma_dragoon_landfire3);	
}