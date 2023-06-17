/// @function		ride_init()
/// @description	Initialize Ride Armor or Ride Chaser
function ride_init() {
	state_machine_init();
	gravity_default = 0.25;
	scr_physics_init(gravity_default);
	animations_init();
	animation_init();
	local_game_speed_init();
	depth -= 1;
	show_mask = false;
	map_sprites = ds_map_create();
	sprite = [noone, noone];
	undefined_sprite_origin = { x: 0, y: 0 };
	default_sprite_origin = { x: 0, y: 0 };
	character_origin_offset = { x: 0, y: -20 };
	character_pos = { x: 0, y: 0, i: 0 };
	character_map_offset = ds_map_create();
	outside = !is_inside_view();
	visible = !outside;
	// Direction
	dir = 1;
	xscale = 1;
	move = 0;
	y_dir = 1;
	// Char
	char_instance = noone;
	is_player = true;
	// Camera Shake
	shake = false;
	shake_t = 0;
	shake_duration = 8;
	scr_keys_reset();
	t = 0;
	layer_up = layer_create(depth - 10);
	effects_list = ds_list_create();
	dash_air_count = 0;
	dash_air_limit = 0;
	limit_x = [floor((bbox_right - bbox_left) / 2), room_width - floor((bbox_right - bbox_left) / 2)];
	limit_y = floor((bbox_bottom - bbox_top) / 2)
	// Dolor
	dolor = false;
	dolor_damage = 1;
	dolor_effect_inst = noone;
	dolor_effect = player_effect_new(obj_ride_x1_damage, 0, 0, layer_up);
	hp = 32;//32
	damage_reduction = 0;
	light = 0;
	player_immunity_variables();
	// Damage
	hit_cancel_sound = true;
}
/// @function		ride_load_sprites()
/// @description	Load ride sprites index into map_sprites
function ride_load_sprites() {
	char_name = string_replace(object_get_name(object_index), "obj_", "");
	ds_map_clear(map_sprites);
	var map_name = animations_sprite_name;
	// For each sprite name
	for (var k = ds_map_find_first(map_name); !is_undefined(k); k = ds_map_find_next(map_name, k)) {
		var action = map_name[? k];
		map_sprites[? action] = array_create(2, noone);
		// For each layer
		for (var i = 0; i < 2; i++) {
			// spr_ride_armor_name_action_layer
			var sprite_name = "spr_" + char_name + "_" + action + "_" + string(i + 1);
			var index = asset_get_index(sprite_name);
			// If this sprite exists
			if (index != -1) {
				map_sprites[? action][i] = index;
				sprite_fix_origin(index);
			}
		}
	}
}
/// @function		ride_step()
/// @description	Function executed every frame
function ride_step() {
	var new_outside = !is_inside_view();
	if (!new_outside && outside != new_outside) {
		visible = true;
	}
	outside = new_outside;
	if (outside) {
		visible = false;	
	}
	t = state_timer++;
	ride_check_leave();
	state_function[state]();
	ride_check_punch();
	ride_check_charge();
	ride_collision();
	ride_check_dead();
	scr_physics_update(false);
	ride_check_dolor();
	player_immunity();
	if (is_on_floor()) {
		grav = 0;
	}
	else {
		grav = gravity_default;
	}
	animation_update(true);
	x = clamp(x, limit_x[0], limit_x[1]);
	with (punch_inst) {
		x = other.x;
		y = other.y;
	}
	with (charge_inst) {
		x = other.x;
		y = other.y;
		image_xscale = other.xscale;
	}
	if (animation_sprite_name != "") {
		var pos = character_map_offset[? animation_sprite_name][animation_i];
		pos[$"i"] ??= 0;
		character_pos.x = x + (pos.x + character_origin_offset.x) * xscale;
		character_pos.y = y + (pos.y + character_origin_offset.y);
		character_pos.i = pos.i
	}
	with (char_instance) {
		other.local_game_speed = local_game_speed;
		animation_play("ride_armor");
		animation_i = other.character_pos.i;
		x = other.x;
		y = other.y;
		mask_index = other.mask_index;
		xscale = other.xscale;
		
		ride_char_pos = other.character_pos;
		other.move = move;
		
		other.key_p_jump = key_p_jump;
		other.key_jump = key_jump;
		
		other.key_p_left = key_p_left;
		other.key_p_right = key_p_right;
		other.key_p_up = key_p_up;
		other.key_p_down = key_p_down;
		
		other.key_left = key_left;
		other.key_right = key_right;
		other.key_up = key_up;
		other.key_down = key_down;
		
		other.key_p_dash = key_p_dash;
		other.key_dash = key_dash;
		
		other.key_p_shoot = key_p_shoot;
		other.key_shoot = key_shoot;
		visible = true;
	}
	sprite = map_sprites[? animation_sprite_name];
	sprite_index = sprite[0];
	if (shake) {
		if (shake_t == 0) {
			global.camera_shake++;	
		}
		shake_t++;
		if (shake_t > shake_duration) {
			shake_t = 0;
			shake = false;
			global.camera_shake--;
		}
	}
}
/// @function		ride_collision()
/// @description	Handle Ride collision
function ride_collision() {
	// Colliding with the ground
	if (is_on_floor(v_speed) && v_speed >= 0) || (is_on_floor() && state == RIDE_ARMOR_STATE.JUMP && state_timer > 0 && v_speed == 0) {
		grav = 0;
	    v_speed = 0;
		if (is_place_free(x, y - 2)) {
			y = floor(y - 2);
		}
		move_down(10);
		walk_speed = walk_speed_default;
		dash_air_count = 0;
		hover_t = 0;
	}
	// Colliding with the ceiling
	else if (is_on_ceil(v_speed) && v_speed < 0) {
		/*if (is_place_free(x, y + 2)) {
			y = floor(y + 2);
		}*/
		v_speed = 0;
		move_contact_block(0, -10);
	}
	if (state == RIDE_ARMOR_STATE.WALK) {
		walk_speed = walk_speed_default;
	}
	if (v_speed >= vspeed_max) {
		v_speed = vspeed_max;
	}
}
/// @function		ride_check_punch()
/// @description	Punch condition
function ride_check_punch() {
	if (!punch) {
		with (punch_inst) {
			instance_destroy();	
		}
	}
	if (key_p_shoot && !charge && !punch && char_instance != noone) {
		punch_animation = "";
		switch (state) {
			case RIDE_ARMOR_STATE.IDLE:
			case RIDE_ARMOR_STATE.WALK:
				state_set(RIDE_ARMOR_STATE.IDLE);
				punch_animation = "punch";
				break;
			case RIDE_ARMOR_STATE.JUMP:
			case RIDE_ARMOR_STATE.FALL:
			case RIDE_ARMOR_STATE.HOVER:
				punch_animation = "jump_punch";
				break;
			case RIDE_ARMOR_STATE.DASH:
				punch_animation = "dash_punch";
				break;
		}
		if (punch_animation != "") {
			punch = true;
			animation = "";
			punch_end_animation = punch_animation + "_end";
			punch_limit = punch_default_limit;
			punch_end = false;
		}
	}
	if (punch) {
		if (!charge && !punch_end) {
			if (animation != punch_animation && punch_animation != "") {
				animation_play(punch_animation, punch_t);
			} else if (punch_animation == "") {
				punch_t = punch_limit + 1;	
			}
		}
		if (punch_t == punch_object_frame) {
			punch_inst = instance_create_layer(x, y, layer_up, punch_object);
			punch_inst.image_xscale = xscale;
			punch_inst.local_game_speed = local_game_speed;
		}
		if (punch_t > punch_limit && !punch_end) {
			punch_end = true;	
			animation_play(punch_end_animation);
		}
		if (punch_end && animation_on_end()) {
			punch = false;
			punch_t = -1;
			punch_end = false;
			punch_animation = "";
			punch_limit = punch_default_limit;
			punch_object = punch_default_object;
			switch (state) {
				case RIDE_ARMOR_STATE.IDLE:
					animation_play("idle", state_timer);
					break;
				case RIDE_ARMOR_STATE.FALL:
					animation_play("fall", state_timer);
					break;
				case RIDE_ARMOR_STATE.DASH:
					animation_play("dash", state_timer);
					break;
			}
		}
		punch_t++;
	} else {
		punch_t = 0;	
		punch_end = false;
		punch_animation = "";
		punch_limit = punch_default_limit;
		punch_object = punch_default_object;
	}
}
/// @function		ride_check_leave()
/// @description	Leave the Ride Armor/Chaser
function ride_check_leave() {
	if (key_up && key_p_jump && state != RIDE_ARMOR_STATE.ACTIVATED) {
		state_set(RIDE_ARMOR_STATE.DEACTIVATING, 0, [is_on_floor()]);
		with (char_instance) {
			state_set(states.jump);	
			ride_inst = noone;
			mask_index = default_mask;
			v_speed = -jump_strength;
			walk_speed = other.walk_speed;
			depth += 4;
			dir = other.dir;
			xscale = dir;
		}
		char_instance = noone;
		h_speed = 0;
		walk_speed = walk_speed_default;
		punch_animation = "";
		scr_keys_reset();
		if (substates[0]) {
			animation_play("deactivating");	
		}
		punch = false;
		punch_animation = "";
		charge = false;
		charge_t = 0;
		audio_stop(snd_ride_armor_charge);
		depth += 5;
	}
}
/// @function		ride_check_charge()
/// @description	Charge condition
function ride_check_charge() {
	if (!charge_unlocked) exit;
	if (!charge) {
		with (charge_inst) {
			instance_destroy();	
		}
	}
	if (state == RIDE_ARMOR_STATE.DEACTIVATING || state == RIDE_ARMOR_STATE.DISABLED) exit;
	if (!is_on_floor()) {
		if (charge) {
			charge = false;
			charge_t = 0;
			punch = false;
			audio_stop(snd_ride_armor_charge);
		}
		exit;
	}
	if (!charge) {
		if (key_shoot && !punch) {
			charge_t++;	
		} else {
			charge_t = 0;	
		}
	}
	if (charge_t == charge_limit) {
		charge = true;
		charge_t = 0;
		punch = true;
		with (charge_inst) {
			instance_destroy();	
		}
		charge_inst = instance_create_layer(x, y, layer_up, charge_object);
		with (charge_inst) {
			sprite_index = other.charge_mask;
			local_game_speed = other.local_game_speed;
		}
		audio_play(snd_ride_armor_charge, true);
		animation_play("charge");
	}
	if (charge) {
		punch_t = 0;
		if (state != RIDE_ARMOR_STATE.DASH && animation != "charge") {
			animation_play("charge");
		}
		if (state == RIDE_ARMOR_STATE.DASH && animation != "dash_charge") {
			animation_play("dash_charge");
		}
		if (state != RIDE_ARMOR_STATE.DASH && state != RIDE_ARMOR_STATE.IDLE) {
			state_set(RIDE_ARMOR_STATE.IDLE);	
		}
		if (!key_shoot) {
			charge = false;
			punch_limit = 16;
			punch_animation = ((state == RIDE_ARMOR_STATE.DASH) ? "dash_" : "") + "punch_charged";
			punch_end_animation = punch_animation + "_end";
			audio_stop(snd_ride_armor_charge);
			audio_stop(dash_sound_index);
			dash_sound_index = audio_play(dash_sound);
			with (charge_inst) {
				instance_destroy();	
			}
			charge_inst = noone;
			state_set(RIDE_ARMOR_STATE.CHARGED_PUNCH);
			punch_object = (state == RIDE_ARMOR_STATE.DASH) ? dash_charged_punch_object : charged_punch_object;
		}
	}
}
/// @function		ride_check_dolor()
/// @description	Dolor condition
function ride_check_dolor() {
	if (instance_exists(dolor_effect_inst)) {
		with (dolor_effect_inst) {
			x = other.x;
			y = other.y;
			xscale = other.xscale;
		}
	}
	if (dolor) {
		audio_play(snd_player_dolor);
		hp -= dolor_damage;
		dolor = false;
		player_activate_immunity(immunity_types.dolor);
		move_x(-6*dir);
	}
	if (light) {
		light--;	
	}
	if (array_contains([
		RIDE_ARMOR_STATE.DISABLED, 
		RIDE_ARMOR_STATE.DEACTIVATING, 
		RIDE_ARMOR_STATE.ACTIVATED], state)) exit;
	var enemy = instance_place(x, y, par_enemy);
	if (!immortal) {
		if (!immunity && instance_exists(enemy) && !enemy.dead && enemy.collide_damage > 0) {
			var _damage_reduction = damage_reduction;
			if (!enemy.grab_player) {
				dolor_damage = max(1, floor(enemy.collide_damage * (1 - _damage_reduction)));
			}
			dolor = true;
			light = 1;
			enemy.player_got_hurt = true;
			dolor_effect_inst = player_effect_create(dolor_effect);
		}
		if (!is_inside_view()) {
			with (char_instance) {
				if (y >= limit_y_death) {
					hp = 0;
					state_set(states.death);
					with (other) {
						state_set(RIDE_ARMOR_STATE.DEACTIVATING, 0, [1]);	
					}
				}
			}
		}
	}
}
/// @function		ride_check_dead()
/// @description	death effect for the Ride Armor/Chaser
function ride_check_dead() {
if (hp <= 0){dead=1}
if (dead){deathtimer --;}
if (deathtimer != deathtimer_max)
   {
	explosion_timer ++ 
	
	if (explosion_timer == 6)
	{
	instance_create_depth(random_range(x-30,x+30),random_range(y-40,y+20),depth-1,explode_FX2)
	audio_play(choose(exploding,exploding2));
	explosion_timer = 0;
	}
   }
if (deathtimer == 1){ride_eject()}
if (deathtimer == 0){instance_create_depth(x,y,depth-1,explosion_set_box);instance_create_depth(x,y,depth-1,explode_FX3);audio_play(exploding5);instance_destroy();}
}
/// @function		ride_eject()
/// @description	Be forcefully ejected from the Ride Armor/Chaser
function ride_eject() {
	if (state != RIDE_ARMOR_STATE.ACTIVATED) {
		state_set(RIDE_ARMOR_STATE.DEACTIVATING, 0, [is_on_floor()]);
		with (char_instance) {
			state_set(states.jump);	
			ride_inst = noone;
			mask_index = default_mask;
			v_speed -= 12;
			walk_speed = other.walk_speed;
			depth += 4;
			dir = other.dir;
			xscale = dir;
		}
		char_instance = noone;
		h_speed = 0;
		walk_speed = walk_speed_default;
		punch_animation = "";
		scr_keys_reset();
		if (substates[0]) {
			animation_play("deactivating");	
		}
		punch = false;
		punch_animation = "";
		charge = false;
		charge_t = 0;
		audio_stop(snd_ride_armor_charge);
		depth += 5;
	}
}