/// Ride Armor States
enum RIDE_ARMOR_STATE {
	DISABLED,
	ACTIVATED,
	IDLE,
	WALK,
	DASH,
	JUMP,
	FALL,
	LAND,
	HOVER,
	CHARGED_PUNCH,
	DEACTIVATING,
	LENGTH
}
/// @function		ride_armor_init()
/// @description	Initialize Ride Armor
function ride_armor_init() {
	default_sprite_origin = { x: 64, y: 69 };
	// State Functions
	state_function[RIDE_ARMOR_STATE.DISABLED]		= ride_armor_disabled;
	state_function[RIDE_ARMOR_STATE.ACTIVATED]		= ride_armor_activated;
	state_function[RIDE_ARMOR_STATE.IDLE]			= ride_armor_idle;
	state_function[RIDE_ARMOR_STATE.WALK]			= ride_armor_walk;
	state_function[RIDE_ARMOR_STATE.DASH]			= ride_armor_dash;
	state_function[RIDE_ARMOR_STATE.JUMP]			= ride_armor_jump;
	state_function[RIDE_ARMOR_STATE.FALL]			= ride_armor_fall;
	state_function[RIDE_ARMOR_STATE.LAND]			= ride_armor_land;
	state_function[RIDE_ARMOR_STATE.HOVER]			= ride_armor_hover;
	state_function[RIDE_ARMOR_STATE.CHARGED_PUNCH]	= ride_armor_charged_punch;
	state_function[RIDE_ARMOR_STATE.DEACTIVATING]	= ride_armor_deactivating;
	// State unlocked
	state_unlocked = array_create(RIDE_ARMOR_STATE.LENGTH, true);
	// Activated
	activated_sound = noone;
	// Walk
	walk_speed_default = 1.5;
	walk_speed = walk_speed_default;
	walk_sounds = [snd_ride_armor_land, snd_ride_armor_walk];
	walk_sound_frames = [11, 36];
	// Dash
	player_dash_variables();
	dash_normal_length *= 2;
	dash_spark.object = noone;
	dash_dust.object = obj_player_wall_slide_dust;
	dash_dust.y = 34;
	dash_dust.max_limit = 14;
	dash_sound = snd_ride_armor_dash;
	dash_sound_index = noone;
	dash_speed = 4;
	// Dash Air
	player_dash_air_variables();
	// Jump
	jump_strength = 5;
	jump_sound = snd_ride_armor_jump;
	land_sound = snd_ride_armor_land;
	// Punch
	punch = false;
	punch_t = 0;
	punch_default_limit = 9;
	punch_limit = punch_default_limit;
	punch_animation = "";
	punch_inst = noone;
	punch_default_object = par_ride_punch;
	punch_object = punch_default_object;
	punch_object_frame = 4;
	punch_end = false;
	// Land
	land_effect[0] = player_effect_new(obj_player_wall_slide_dust, -12, 35, layer_up);
	land_effect[1] = player_effect_new(obj_player_wall_slide_dust, 11, 35, layer_up);
	steam_effect[0] = player_effect_new(obj_ride_armor_steam, 0, 0, layer_up);
	steam_effect[1] = player_effect_new(obj_ride_armor_steam, 14, 0, layer_up);
	steam_effect_activate = false;
	// Hover
	hover_unlocked = false;
	hover_t = 0;
	hover_limit = 40;
	// Charge
	charge = false;
	charge_t = 0;
	charge_limit = 30;
	charge_unlocked = false;
	charge_mask = spr_ride_armor_x2_charge_1;
	charge_object = obj_ride_charge;
	charge_inst = noone;
	charged_punch_speed = 6;
	charged_punch_object = obj_ride_charged_punch;
	dash_charged_punch_object = obj_ride_dash_charged_punch;
	state_set(RIDE_ARMOR_STATE.DISABLED);
	// Death
	deathtimer_max = 250;
    deathtimer = deathtimer_max;
    explosion_timer = 0;
    dead = 0;
}
/// @function		ride_armor_after_step
/// @description	Run this after the state step script
function ride_armor_after_step() {
	if (steam_effect_activate) {
		steam_effect_activate = false;
		for (var i = 0, len = array_length(steam_effect); i < len; i++) {
			player_effect_create(steam_effect[i]);	
		}
	}
}
#region States
/// @function		ride_armor_disabled
/// @description	It is disabled
function ride_armor_disabled() {
	image_yscale = 0.5;
	var inst = instance_place(x - 20*dir, y + 10, obj_player_parent);
	image_yscale = 1;
	if (inst != noone && inst.state != states.ride && inst.hp > 0 && array_contains([states.idle, states.jump, states.walk, states.fall, states.land], inst.state)) {
		char_instance = inst;
		state_set(RIDE_ARMOR_STATE.ACTIVATED);
		animation_play("activated");
		depth -= 5;
		audio_play(activated_sound);
		with (char_instance) {
			ride_inst = other.id;
			v_speed = 0;
			h_speed = 0;
			grav = 0;
			dash_air_count = 0;
			depth -= 4;
			state_set(states.ride);
			audio_stop(hover_sound);
			player_dolor_reset();
			player_effects_reset();
			player_saber_reset();
		}
	}
}
/// @function		ride_armor_activated()
/// @description	It is activating
function ride_armor_activated() {
	if (animation_on_end()) {
		state_set(RIDE_ARMOR_STATE.IDLE);
		steam_effect_activate = true;
	}
}
/// @function		ride_armor_idle()
/// @description	Idle state step
function ride_armor_idle() {
	if (t == 0) {
		animation_play("idle");
	}
	if (move != 0 && (!punch || charge)) {
		dir = move;
		xscale = dir;			
	}
	ride_armor_check_walk();
	ride_armor_check_dash();
	ride_armor_check_hover();
	ride_armor_check_jump();
}
/// @function		ride_armor_check_walk()
/// @description	Walk state condition
function ride_armor_check_walk() {
	if (punch) return;
	if ((v_speed == 0 && move != 0) && (is_on_floor() && state != RIDE_ARMOR_STATE.DASH))
		state_set(RIDE_ARMOR_STATE.WALK);
}
/// @function		ride_armor_walk()
/// @description	Walk State step
function ride_armor_walk() {
	if (is_on_floor() && move != 0) {
		player_check_move(!punch);
		if (t == 0) {
			animation_play("walk");
		}
		var index = array_find(walk_sound_frames, animation_t);
		if (index != -1) {
			audio_play(walk_sounds[index]);	
		}
	} else {
		if (is_on_floor()) {
			state_set(RIDE_ARMOR_STATE.IDLE);
		} else {
			v_speed = 0;
			ride_armor_check_fall();
		}
	}
	// Action Scripts
	ride_armor_check_dash();
	ride_armor_check_jump();
}
/// @function		ride_armor_check_dash()
/// @description	Dash state condition
function ride_armor_check_dash() {
	if (punch && !charge) return;
	if (state_unlocked[RIDE_ARMOR_STATE.DASH]) {
	    // Double Tap
		var result = move;
	    var start_dash = false;
		var keys_p = [key_p_left, key_p_right, key_p_up, key_p_down];
		var dash_tap_index = -1;
		for (var i = 0; i < 4; i++) {
			if (keys_p[i]) {
				if (dash_tap_timers[i] > 0) {
					start_dash = true;
					// Left/Right
					if (i == 0)
						dash_tap_index = 0;
					else if (i == 1)
						dash_tap_index = 1;
					else if (!is_on_floor() && dash_up_unlocked)
						dash_tap_index = i;
					else
						start_dash = false;
					if (start_dash)
						dash_tap_timers = [0, 0, 0, 0];
				} else {
					dash_tap_timers[i] = dash_tap_limit;
				}
			}
			if (dash_tap_timers[i] > 0)
				dash_tap_timers[i]--;
		}
    
	    // Dash Key Pressed or Double Tap
	    if (key_p_dash || start_dash) {
	        var new_dash_dir = dir;
	        var result = key_right - key_left;
		
	        if (result != 0)
				new_dash_dir = result;
		
			if (dash_tap_index == 0)
				new_dash_dir = -1;
			else if (dash_tap_index == 1)
				new_dash_dir = 1;
		
			if ((!dash_up_unlocked || (!key_up && !key_down) || (start_dash && dash_tap_index < 2) || is_on_floor()) &&
			//(can_move_x(dash_speed * new_dash_dir)) &&
			((is_on_floor() && state != RIDE_ARMOR_STATE.JUMP) || (dash_air_unlocked && dash_air_count < dash_air_limit)) &&
			(!dash_tapped || (result != dash_dir && key_p_dash)) &&
			(!start_dash || (new_dash_dir != dash_dir || state != RIDE_ARMOR_STATE.DASH))) {
				state_set(RIDE_ARMOR_STATE.DASH, 0);
				dir = new_dash_dir;
				dash_dir = dir;
				dash_tap_dir = 0;
				dash_tapped = start_dash;
				substates[0] = !is_on_floor(); // 0 = Normal Dash, 1 = Dash Air
				substates[1] = 0; // 0 = Horizontal, 1 = Up
				substates[2] = 0; // Not Cancelling
				dash_air_count++;
				if (!is_on_floor() && punch_animation != "dash_punch") {
					punch_animation = "";
				}
				
			}
			else if ((dash_up_unlocked && key_up && state != states.wall_slide) &&
			(!is_on_ceil() && !is_on_floor() && (dash_air_count < dash_air_limit))/* &&
			(!dashend || !dashup)*/) {
				state_set(RIDE_ARMOR_STATE.DASH, 0);
				dir = new_dash_dir;
				dash_dir = dir;
				dash_tapped = start_dash;
				substates[0] = 1; // Dash Air
				substates[1] = 1; // Up
				substates[2] = 0; // Not Cancelling
				dash_air_count++;
			}
	    }
	}
	if (state != RIDE_ARMOR_STATE.DASH)
		dash_tapped = false;
}
/// @function		ride_armor_dash()
/// @description	Dash state step
function ride_armor_dash() {
	dash_air = (substates[0] == 1);
	dash_up = (substates[1] == 1);
	dash_end = (substates[2] == 1);
	// Dash (Not End)
	if (!dash_end) {
		// Dash (Horizontal)	
		if (!dash_up) {
		    if (t == 0) {
		        // Play Audio
				audio_stop(dash_sound_index);
		        dash_sound_index = audio_play(dash_sound);
		
		        if (dash_air) {
		            dash_length = dash_air_length;
		            v_speed = 0;
		        } else {
					dash_length = dash_normal_length;
				}
		    }
			var condition = (t == dash_length + 1);
		    if (t >= 0 && t <= dash_length) {
		        // Animation
		        if ((is_on_floor() || dash_air) && punch_animation == "" && !charge)
					animation_play("dash");
        
		        // Gravity
		        if (dash_air) {
					grav = 0;
					v_speed = 0;
				}
				xscale = dir;
		
		    }
		    // Dash Spark
		    if (t == 1) {
		        dash_spark_inst = player_effect_create(dash_spark);
		    }
		    // Dash Movement
		    if (t >= 1 && t <= dash_length) {
		        if (!move_x(dash_speed * dash_dir) || (!is_on_floor() && !dash_air))
					condition = true;
        
				// Dash Dust
				if (instance_exists(dash_dust) && dash_dust.script != noone)
					script_execute(dash_dust.script);	
		    }
		    // Dash Spark - Reset Relative Position
		    if (t == 1 || t == 2)
				player_effect_pos_reset(dash_spark_inst);
    
		    var result = key_right - key_left;
    
		    if (!dash_tapped) {
		        condition |= !key_dash;
		    } else {
				condition |= (result != dash_dir);
			}
		    condition |= (result != 0 && result != dash_dir);
    
		    if (condition) {
		        dash_spark_inst = player_effect_destroy(dash_spark_inst);
		
		        if ((key_p_jump) || !is_on_floor()) {
					walk_speed = dash_speed;
			
		            if (is_on_floor()) {
						state_set(RIDE_ARMOR_STATE.IDLE);
		            } else {
						if (move != 0) {
							state_set(RIDE_ARMOR_STATE.FALL);
							animation_play("fall");
						} else {
							state_timer = 0;
							substates[2] = 1;
						}
					}

					dash_tapped = false;
		            dash_tap = false;
		        }
        
		        if (!key_p_jump && is_on_floor(3)) {
		            walk_speed = walk_speed_default;
		            v_speed = 0;
					substates[2] = 1;
					state_timer = 0;
		            move_down();
		            player_counters_reset();
		        }
        
		    }
		}
		// Dash (Vertical)
		else {
			if (!dash_tapped) {
		        condition_to_end |= !key_dash;
		    } else {
				condition_to_end |= !key_up;
			}
			if (t == 0) {
				dash_length = dash_up_length;
			    v_speed = 0;
				xscale = dir;
				animation = "";
			}
			var condition_to_end = (t == dash_length + 1 || (key_p_jump && is_on_floor()));
	
			if (t == 16)
				dash_spark_inst = player_effect_create(dash_up_spark);
	
			if (t >= 0 && t <= dash_length) {
				animation_play("dash_up");
				grav = 0;
				v_speed = 0;
			}
	
			if (array_contains([1, 3, 7, 9, 11, 13, 15, 16], t))
				condition_to_end |= !move_contact_block(0, -1);
	
			if (t == 19)
				audio_play(dash_sound);	
	
			if (t >= 19 && t <= 20)
				condition_to_end |= !move_contact_block(0, -2);
	
			if (t >= 21 && t <= dash_length)
				condition_to_end |= !move_contact_block(0, -5);
	
			if (condition_to_end) {
				// Dash End
				substates[2] = 1;
				state_timer = 0;
		
				walk_speed = dash_speed;
				player_effect_destroy(dash_spark_inst);
			}
		}
	}
	// Dash End
	else {
		player_check_move(!punch);
		if (is_on_floor())
			walk_speed = walk_speed_default;
	    // Horizontal
		if (!dash_up) {
			if (t <= 6 || is_on_floor(3) || dash_air) {
				animation_play("dash_end");
			}
		}// Vertical
		else {
			animation_play("dash_up_end")
		}
	
		if (t >= 7 || (key_left ^^ key_right)) {   
		    dash_tapped = false;
		    dash_tap = false;
			y_dir = 1;
		
			state_set(RIDE_ARMOR_STATE.IDLE);
			if (!is_on_floor(3)) {
				state_set(RIDE_ARMOR_STATE.FALL);
				if (!punch) {
					animation_play("fall");
				}
			}
		
			substates[0] = 0;
			substates[1] = 0;
			substates[2] = 0;
			with (dash_dust) {
				timer = 0;	
			}
		}
	}

	// Action Scripts
	if (!punch)
		ride_armor_check_walk();
	ride_armor_check_dash();
	ride_armor_check_hover();
	if (!punch)
		ride_armor_check_jump();

	// Changed State
	if (state != RIDE_ARMOR_STATE.DASH) {
		dash_spark_inst = player_effect_destroy(dash_spark_inst);
		dash_tapped = false;
		/*
		y_dir = 1;
		
		if (key_down && crouch_unlocked)
			state_hitbox_current = state_hitbox[states.crouch];
			*/
	}
}
/// @function		ride_armor_check_jump()
/// @description	Jump state condition
function ride_armor_check_jump() {
	if (punch) return;
	if (key_p_jump) {
		var can_jump = is_on_floor() && !is_on_ceil();
		if (can_jump) {
			if (state == RIDE_ARMOR_STATE.DASH) {
				walk_speed = dash_speed;
			}
			state_set(RIDE_ARMOR_STATE.JUMP);
			animation_play("jump");
			v_speed = -jump_strength;
			audio_play(jump_sound);
		}
	}
}
/// @function		ride_armor_jump()
/// @description	Jump state step
function ride_armor_jump() {
	player_check_move(!punch);
	if (!key_jump && v_speed < 0) {
		v_speed = 0;
	}
	if (!is_on_floor()) {
		ride_armor_check_fall();
	} else {
		v_speed = 0;
		if (t >= 1 && v_speed >= 0) {
			state_set(RIDE_ARMOR_STATE.IDLE);
		}
		ride_armor_check_walk();
	}

	if (punch) return;
	ride_armor_check_dash();
}
/// @function		ride_armor_check_fall()
/// @description	Fall state condition
function ride_armor_check_fall() {
	if (!is_on_floor() && v_speed >= 0) {
		state_set(RIDE_ARMOR_STATE.FALL);
		if (!punch) {
			animation_play("fall");
		}
	}
}
/// @function		ride_armor_fall()
/// @description	Fall state step
function ride_armor_fall() {
	player_check_move(!punch);
	ride_armor_check_land();
	ride_armor_check_dash();
	ride_armor_check_hover();
}
/// @function		ride_armor_check_land()
/// @description	Land state condition
function ride_armor_check_land() {
	if (is_on_floor() && state == RIDE_ARMOR_STATE.FALL) {
		state_set(RIDE_ARMOR_STATE.LAND);
		animation_play("land");
		shake = true;
		punch_animation = "";
		audio_play(land_sound);
		steam_effect_activate = true;
		for (var i = 0, len = array_length(land_effect); i < len; i++) {
			player_effect_create(land_effect[i]);	
		}
	}
}
/// @function		ride_armor_land()
/// @description	Land state step
function ride_armor_land() {
	player_check_move();
	if (animation_on_end()) {
		state_set(RIDE_ARMOR_STATE.IDLE);
	}
	ride_armor_check_dash();
	ride_armor_check_fall();
}
/// @function		ride_armor_deactivating()
/// @description	Deactivating armor step
function ride_armor_deactivating() {
	var falling = substates[0] == 0;
	if (falling) {
		if (t == 0) {
			animation_play("fall");	
		}
		if (is_on_floor()) {
			state_set(RIDE_ARMOR_STATE.DEACTIVATING, 0, [1]);
			animation_play("deactivating");	
		}
	} else {
		if (animation_on_end()) {
			state_set(RIDE_ARMOR_STATE.DISABLED, 0, [0]);
			animation_play("disabled");	
		}
	}
}
/// @function		ride_armor_check_hover()
/// @description	Hover state condition
function ride_armor_check_hover() {
	if (hover_unlocked && key_jump && !is_on_floor() && !punch && hover_t < hover_limit) {
		if (state == RIDE_ARMOR_STATE.DASH) {
			walk_speed = dash_speed;
		}
		state_set(RIDE_ARMOR_STATE.HOVER);
		animation_play("hover");
	}
}
/// @function		ride_armor_hover()
/// @description	Hover state step
function ride_armor_hover() {
	player_check_move();
	hover_t++;
	v_speed = -1;
	grav = 0;
	if (!key_jump || hover_t >= hover_limit || punch) {
		if (v_speed < 0) {
			v_speed = 0;
		}
		grav = gravity_default;
		state_set(RIDE_ARMOR_STATE.FALL);
		if (!punch) {
			animation_play("fall");
		}
	}
}
/// @function		ride_armor_charged_punch()
/// @description	Charged punch state step
function ride_armor_charged_punch() {
	move_x(charged_punch_speed*dir);
	if (instance_exists(dash_dust) && dash_dust.script != noone) {
		script_execute(dash_dust.script);	
	}
	if (punch_end || !is_on_floor()) {	
		if (!is_on_floor()) {
			walk_speed = charged_punch_speed;	
			punch_animation = "";
			punch_end = true;
			state_set(RIDE_ARMOR_STATE.FALL);
			animation_play("fall");
		} else {
			state_set(RIDE_ARMOR_STATE.IDLE);
		}
		with (dash_dust) {
			timer = 0;	
		}
	}
}
#endregion