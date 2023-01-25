enum OCTOPUS {
	MISSILE,
	JUMP_MISSILE,
	JUMP_WHIRLPOOL,
	WHIRLPOOL,
	PIRANHA,
	ENERGY_DRAIN
}
switch (state) {
	#region Jump before Whirlpool Attack
	case OCTOPUS.JUMP_WHIRLPOOL:
		if (t == 0) {
			animation_play("fall");
			v_speed = -jump_strength;
			grav = gravity_default;
			look_at_player();
			h_speed = (distance_x) / (abs(v_speed / grav)) * dir;
		}
		if (v_speed >= 0) {
			state_set(OCTOPUS.WHIRLPOOL);
			var whirlpool_inst = instance_create_depth(x - 32, y, layer_get_depth(layer_get_id("Camera")) + 10, obj_launch_octopus_tornado);
			whirlpool_inst.owner = id;
			h_speed = 0;
			grav = 0;
		}
		break;
	#endregion
	#region Jump to Attack with Missile
	case OCTOPUS.JUMP_MISSILE:
		if (t == 0) {
			look_at_player();
			for (var i = 0; i < 3; i++) {
				var inst = instance_create_depth(x, y, depth - 5, obj_launch_octopus_missile);
				inst.h_speed = (inst.abs_hspeed - (i - 1) * 0.1) * dir;
				if (i == 0) {
					inst.v_speed = -0.25;
				} else if (i == 1) {
					inst.v_speed = -0.6;
				} else {
					inst.v_speed = 0.6;	
				}
				inst.v_speed *= missile_speed_multiplier.vsp;
				inst.h_speed *= missile_speed_multiplier.hsp;
				inst.dir = dir;
				inst.xscale = -dir;
				audio_play(snd_octopus_missile);
			}
		}
		if (substates[0] == 0) {
			if (t == 0) {
				animation_play("missile_1");
				v_speed = -jump_strength * 3/4;
				grav = gravity_default;
				h_speed = (64) / (abs(v_speed / grav)) * dir;
			}
			if (v_speed >= 0) {
				animation_play("missile_2");
				state_set(state, 0, [1]);
			}
		} else {
			if (t == 18) {
				animation_play("missile_3");	
			}
		}
		if (substates[0] && is_on_floor()) {
			state_set(boss_states.idle, 0, [1]);
			h_speed = 0;
			v_speed = 0;
			grav = 0;
		}
		break;
	#endregion
	#region Whirlpool (Spin attack)
	case OCTOPUS.WHIRLPOOL:
		animation_play("whirlpool");
		if (substates[0] == 0) {
			grab_player = true;
			grav = 0;
			v_speed = 0;
			if (t < whirlpool_length / 2) {
				move_y(whirlpool_speed)
			} else {
				move_y(-whirlpool_speed);
			}
			if (grabbing_player) {
				state_set(OCTOPUS.ENERGY_DRAIN);
				grab_player_inst.locked = true;
				move_y(grab_player_inst.y - y);
				move_y(-grab_player_inst.energy_drain_y);
				dir = grab_player_inst.dir;
				if (place_meeting(x - 4, y, obj_block_parent)) {
					move_x(-4);
					move_x(8);
				} else if (place_meeting(x + 4, y, obj_block_parent)) {
					move_x(4);
					move_x(-8);
				}
				grab_player_inst.y = y + grab_player_inst.energy_drain_y;
				grab_player_inst.x = x + grab_player_inst.energy_drain_x*grab_player_inst.dir;
				with (grab_player_inst) {
					player_charge_reset();
					player_saber_reset();
					charge_enabled = false;
					saber_enabled = false;
					shoot_enabled = false;
				}
				v_speed = 0;
				h_speed = 0;
				break;
			}
		
			if (t >= whirlpool_length) {
				v_speed = 0;
				grav = gravity_default;
				state_set(state, 0, [1]);
				grabbing_player = false;
				grab_player = false;
				grab_player_inst = noone;
			}
		} else {
			grav = 0;
			v_speed = 0;
			move_y(-whirlpool_speed);
			if (is_on_ceil()) {
				state_set(boss_states.fall, 0, [0]);
				look_at_player();
				grav = gravity_default;
			}
		}
		break;
	#endregion
	#region Energy Drain
	case OCTOPUS.ENERGY_DRAIN:
		grav = 0;
		v_speed = 0;
		h_speed = 0;
		animation_play("energy_drain");
		with (grab_player_inst) {
			animation_play("energy_drain");	
		}
		grab_player_inst.grab_wait = -1;
		if (t mod 32 == 31) {
			grab_player_inst.hp--;
			hp++;
			if (hp > max_hp) {
				hp = max_hp;	
			}
			audio_play(snd_octopus_drain);
		}
		if (grab_player_inst.hp == 0 || grab_player_inst.grab_count > grab_move_limit) {
			state_set(OCTOPUS.WHIRLPOOL, 0, [1]);
			if (grab_player_inst.hp > 0) {
				move_y(-16 - (19 - grab_player_inst.energy_drain_y));	
			}
			with (grab_player_inst) {
				grab_count = 0;
				if (hp <= 0) {
					state_set(states.death);
				} else {
					player_check_fall();
					player_check_idle();
					charge_enabled = true;
					locked = false;
					saber_enabled = true;
					shoot_enabled = true;
				}
			}
			grabbing_player = false;
			grab_player = false;
			grab_player_inst = noone;
			grav = gravity_default;
		}
		break;
	#endregion
	#region
	case OCTOPUS.PIRANHA:
		if (t == 0) {
			animation_play("piranha");	
		}
		if (t == 35) {
			var pos = [{x: 56, y: -10}, {x: 40, y: 6}, {x: -40, y: 6}, {x: -56, y: -10}];
			for (var i = 0; i < 4; i++) {
				var inst = instance_create_depth(x + pos[i].x*dir, y + pos[i].y, depth - 5, obj_launch_octopus_piranha);
				inst.dir = (i < 2) ? dir : -dir;
				inst.xscale = -inst.dir;
				audio_play(snd_octopus_missile);
			}
		}
		if (animation_on_end()) {
			state_set(boss_states.idle);	
		}
		break;
	#endregion
}