function player_start() {
	// States
	player_states();
	is_player = true;
	locked = false;
	// Weapon Demo
	weapon_demo = false;
	weapon_demo_t = 0;
	weapon_demo_limit = 180;
	weapon_demo_finished = false;
	visible = false;

	// Transition
	if (room != rm_start_menu)
		transition_create(transition_types.fade_in);

	// Name
	char_name = string_replace(object_get_name(object_index), "obj_player_", "");
	my_character = player_get_char_id(char_name);

	// Life Up Sprite
	var _sprite = asset_get_index("spr_" + char_name + "_pickup_lifeup");
	if (_sprite != -1) {
		global.pickup_lifeup_sprite = _sprite;
	}
	// Voices
	player_voices_init();

	// Sprites
	pl_sprite[P_EXT4] = 0;

	sprite_str = ds_map_create();
	sprite_shoot_str = ds_map_create();

	my_sprites = ds_list_create();
	my_sprites_shoot = ds_list_create();

	for (var i = 0; i <= P_EXT4; i++) {
		my_sprites[| i] = ds_map_create();
		ds_list_mark_as_map(my_sprites, i);
		my_sprites_shoot[| i] = ds_map_create();
		ds_list_mark_as_map(my_sprites_shoot, i);
	}
	undefined_sprite_origin = { x: 0, y: 0 };
	default_sprite_origin = { x: 32, y: 40 };

	ride_char_pos = { x: 0, y: 0 };
	ride_inst = noone;
	
	// Layers
	layer_up = layer_create(depth - 6);
	layer_down = layer_create(depth + 6);

	// Camera
	cam = noone;
	if (room != rm_start_menu)
		cam = instance_create_layer(x, y, layer_up, obj_camera_rds);
	// Bar
	bar = noone;
	if (room != rm_start_menu) {
		bar = instance_create_depth(x, y, layer_get_depth(layer_get_id("Camera")) - 300, obj_player_bar);
		bar.owner = id;
		bar.bar_icon_index = my_character;
	}
	// Ready
	if (room != rm_start_menu)
		instance_create_depth(cam.mid_x, cam.mid_y, -900, obj_player_ready);

	// FPS
	if (room != rm_start_menu) {
		fps_inst = instance_create_depth(x, y, -900, obj_text);
	}
	// Scripts
	variables_script = noone;
	armor_script = noone;
	weapon_offsets_script = noone;

	// Draw condition
	surface_draw_init();

	// Pos Start
	x_start = x;
	y_start = y;
	x_previous = x;
	y_previous = y;
	x_door_check = x;
	y_door_check = y;
	in_air = 0;
	limit_y_death = room_height + sprite_height;
	trail_init(5);
	player_trail_set(4, 4);
	trail_sprites_enabled = false;
	trail_sprites = ds_list_create();
	trail_mode = 0;
	trail_color = $f69701;

	// Animation
	animation_init();
	animations_init();
	animation_script = player_x_animation;
	animation_controller = player_x_animation_controller;

	// Keys
	scr_keys_reset();

	// Health
	top_health = 16;
	max_hp = global.player_max_health;
	max_bar_hp = 32;
	hp = max_hp;
	critical = false;
	critical_health = 0.25; // 25%
	full_health = true;
	dead = false;

	// Auto Regen
	auto_regen = false;
	auto_regen_timer = 0;
	auto_regen_state = states.idle;
	auto_regen_limit = 180;
	auto_regen_object = obj_player_regen;

	// Direction (1 = right, -1 = left)
	dir = 1;
	y_dir = 1;
	xscale = 1;

	// Gravity
	scr_physics_init(0.25);
	water_physics_enabled = true;
	
	// Weapon
	weapon_offset = ds_map_create(); // Weapon (X, Y) Offset

	// Special Weapons
	special_weapons = ds_list_create();

	// Effects
	effects_list = ds_list_create();
	light = 0;

	// Armor
	for (var i = 0; i <= P_EXT4; i++) {
		armor[i] = "";
		armor_part_parent[i] = i;
	}

	// Armor Order (Draw Event)
	armor_current_order = [0, 1, 2, 3, 4, 5];
	armor_order_map = ds_map_create();
	armor_order_script = noone;

	// Shoot
	shoot = false; // Is the player shooting
	shoot_t = 0; // Timer
	shoot_animation = ""; // Animation
	shoot_limit = 15; // Timer Limit
	shoot_enabled = false; // Is shot enabled?
	shoot_unlocked = true; // Does this player shoot?
	shoot_next_animation = ""; // Next Animation
	shoot_at_time = 8; // Shoot at frame ?
	shoot_projectile = noone; // Object
	shoot_next_projectile = noone; // Object
	shoot_next_wait = false; // Must the player wait the next animation to end to shoot again?
	shoot_wait = false; // Must the player wait the current animation to end to shoot again?
	shoot_wait_press = false; // Will only shoot again if press the shoot key
	shoot_cancel_on_wall = false; // Cancel animation if the player wall jump/slide?
	shoot_type = shoot_types.normal; // Type
	shoot_next_type = shoot_types.normal; // Type
	shoot_update_position = true;
	shoot_direction_index = 0;
	projectiles_queue = ds_queue_create();

	enum shoot_types
	{
		normal, special, super_shot, super_shot_crouch, 
		ceil_cling, no_animation
	}
	// Shot
	shot_id = 0;
	previous_shot_id = 0;
	shots_count = 0;
	shots_limit = 3;
	dash_shot_count = 0;
	dash_shot_limit = 1;
	shot_angle = 0;
	shot_current_angle_index = 0;
	shot_offset_x = 0;
	shot_offset_y = 0;
	
	// Charge
	charge = false; // Is the player charging a shot?
	charge_t = 0; // Timer
	charge_speed = 1; // Speed
	charge_i = 0; // Image Index of Charge Sprite
	charge_level = -1; // Current Charge Level
	previous_charge_level = -1;
	charge_level_max = 2; // Max Charge Level
	charge_limits = [0, 4, 63, 123, 183]; // Time for each level
	charge_sprite = noone; // Current Charge Sprite
	charge_sprites = // All Charge Sprites
	[
		noone,
		spr_player_charge_1,
		spr_player_charge_2,
		spr_player_charge_3,
		spr_player_charge_saber
	];
	auto_charge_sprite = spr_player_charge_hyper;
	charge_palettes = [0, 1, 1, 2, 3]; // All Charge Palettes
	charge_palette = 0; // Current Charge Palette
	charge_blink = false; // Is the Charge Blinking (Swapping Palette every few frames)
	charge_blink_t = 0; // Timer
	charge_sound = snd_player_charge; // Charge Sound
	charge_enabled = false; // Is the Charge enabled?
	charge_unlocked = false;
	charged_shots_limit = 1;
	charged_shots_count = 0;
	charge_image_number = 22;
	charge_sprite_min_level = 1;
	auto_charge = false;
	auto_charge_palette = 4;
	// Weapon
	enum weapon_styles {
		snes, psx
	}

	palette_init();
	player_weapon_settings();
	player_weapon_sprites_init();
	player_glow_init();
	
	for (var i = 80; i >= 0; i--) weapon_list[i] = noone;
	weapon[0] = weapons.x_buster; // Primary weapon
	weapon[1] = noone; // Secondary weapon (Disabled in Snes Style)

	weapon_name = "";
	weapon_id = 0;
	weapon_hold_mode = false;
	weapon_overlay_enabled = false;
	weapon_bar_display = weapon[0];
	weapon_bar_show = false;
	weapon_previous = weapon[0];
	weapon_dir_offsets = [];
	weapon_allow_pallete = true;
	weapon_can_change = false;
	
	// Special Input
	special_input_init();

	player_weapon_set(0, weapons.x_buster);
	player_saber_init();
	player_variables();
	
	default_mask = mask_index;
	
	glow_init();
	local_game_speed_init();
	local_game_speed = 1;
	using_world_speed = false;
	
	pause_enabled = false;
}

function player_trail_set(interval, amount) {
	trail_speed = 1 / interval;
	trail_size = (amount + 1) * interval;
	trail_sprites_enabled = false;
	trail_sprites_remove = false;
}