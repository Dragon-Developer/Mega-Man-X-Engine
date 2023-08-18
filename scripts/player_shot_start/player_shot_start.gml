function player_shot_start() {
	// Damage Value
	atk = 1;
	destroy_if_equal_to_atk = false;
	destroy_if_hit = false;

	// Boss Damage Table
	boss_damage = ds_map_create();
	boss_damage[? noone] = 1;

	// Timer
	timer = 0;
	
	// Animation
	image_speed = 0;
	image_index_start = 0;
	animation_init();
	animations_init();
	animation_auto = true;
	animation_end_destroy = false;

	// Sound
	sound = noone;
	sound_played = false;
	sound_index = -1;
	
	// Hierarchy
	owner = noone;
	owner_x = x;
	owner_y = y;
	follow_owner = false;
	is_player = false;
	
	// Physics
	scr_physics_init(0, 0, 0);
	x_start = x;
	y_start = y;
	abs_hspeed = 0;
	physics_auto = true;

	// Absolute Speed
	abs_hspeed = 0;

	// Destroy
	destroy = false;
	destroy_t = 0;
	auto_destroy = false;
	auto_destroy_limit = 20; // Destroy itself after this amount of frames
	anti_destroy = false;
	anti_destroy_limit = 1;
	destroy_reset_speed = true;

	// Blocked
	blocked = false;
	block_sound = snd_block;

	// Hit
	can_hit = true;
	hit_sound = enemyhit;
	hit_cancel_sound = false;
	hit_sound_on_destroy = false;
	hit_only_once = false;
	
	// Is charged shot?
	charged_shot = false;

	// Step
	execute_step_in_first_frame = false;

	// Collision
	melee_activated = false;
	melee_counter = -1; // We use this to control how many frames an enemy can be hit by a multihit attack;
	lv = 1; // Attack level. Indicates if your attack is stronger than an enemy attack. if it is, your attack will cancel their's
	shot_level = 0; // If the shot level is higher than the boss buffer level, hit it
	shot_level_increase_frames = 0; // Increase shot level every amount of frames
	shot_level_increase_t = 0;
	boss_buffer_limit = 66;
	hit_if_shot_level_is_equal = false;
	element = 0; // It can be used to indicate element specific effects
	through_walls = 1; // Does our shot go through walls?
	on_collision = function() {};

	enum weapon_types {
		none,
		projectile,
		saber
	}
	enum weapon_death_types {
		normal,
		saber
	}

	ignore_cost = false;
	weapon_type = weapon_types.projectile;
	weapon_death_type = weapon_death_types.normal;
	dash = false;
	dash_enabled = false;
	// Angle
	shot_angle = 0;
	shot_dir = 0;

	// Does this count as a shot?
	shot_counted = true;
	is_main = false;
	shots_group = ds_list_create();
	ds_list_add(shots_group, self);

	// Particles
	particle_object = noone;
	particle_time_course = 4;
	particle_time_start = 0;
	particle_ystart = -6;
	particle_xstart = -16;
	particle_t = 0;
	particle_hspeed = 6;
	particle_h_accel = 0.2;
	particle_variable_ystart = true;
	particle_depth = 0;

	// Target (enemy or boss)
	target = noone;

	// Will not pause in these paused states
	pause_exceptions = [];

	// Surface
	surface_draw_init();

	// Trail
	trail_init(0);

	// Local Game Speed
	local_game_speed_init();
	using_world_speed = false;
}
