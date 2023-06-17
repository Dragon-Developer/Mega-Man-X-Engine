function player_variables() {
	// Start
	intro = false; // Starting Teleport
	intro_sound = snd_player_intro;
	intro_animation = "intro"; // Unarmored part
	intro_end_animation = ""; // Armored part
	intro_end_sound = snd_player_intro_end; // Sound 

	// Outro
	outro_sound = snd_player_outro;
	outro_animation = "outro";
	outro_complete_animation = "outro";
	complete_effect_limit = 0;
	complete_effect = player_effect_new(obj_player_complete, 4, -16, layer_up);
	outro_move_y = 0;
	teleport_outro = false;

	// Breath
	breath_effect = player_effect_new(obj_player_breath, 0, 0, layer_up);
	breath_effect.timer_limit = 60;
	breath_enabled = false;
	
	// Dest
	dest_x = 0;

	// Animation
	player_animations();
	animation_play("idle");

	// Idle
	idle = true;
	idle_animation = "idle";

	// Crouch
	crouch = false;
	crouch_unlocked = true;

	// Grab
	grab_wait = -1;
	grab_count = 0;
	grab_last_dir = 1;
	energy_drain_y = 19;
	energy_drain_x = -2;

	// Walk
	walk = false; // Is the player walking?
	walk_speed_default = 1.5; // Speed (pixels / frame)
	walk_speed = walk_speed_default; // Current Walk Speed
	
	// Dash
	player_dash_variables();
	
	// Dash - Air Dash
	player_dash_air_variables();
	
	// Jump
	jump = false; // Is the player jumping?
	jump_strength = 5; // Initial Vertical Speed
	jump_sound = snd_player_jump; // Jump Sound
	jump_animation_enabled = true; // Is the jump animation enabled?

	// Double Jump
	double_jump_unlocked = false;

	// Fall
	fall = false; // Is the player falling?
	vspeed_max = 5.75; // Maximum Vertical Speed
	ceil_reset_vspeed = true;

	// Land
	land = false;
	land_sound = snd_player_land; // Sound

	// Wall Slide
	wall_slide = false; // Is the player sliding on the wall?
	wall_slide_dir = 1; // Direction
	wall_slide_sound = snd_player_wall_slide; // Wall Slide Sound
	wall_slide_animation_enabled = true; // Is the animation enabled?
	wall_slide_vspeed = 2; // Vertical Speed
	// Wall Slide - Effects
	/// Dust
	wall_slide_dust = player_effect_new(obj_player_wall_slide_dust, -16, 16, layer_up, 4, player_wall_slide_dust);

	// Wall Jump
	wall_jump = false; // Is the player jumping on the wall?
	wall_jump_dir = 1; // Direction
	wall_jump_strength = 5; // Initial Vertical Speed
	wall_jump_reset_gravity = false; // Set to true when the player is on the ceiling to ignore gravity
	wall_jump_animation_enabled = true; // Is the animation enabled?

	// Wall Jump - Effect
	wall_jump_spark = player_effect_new(obj_player_wall_jump_spark, 16, 20, layer_up);

	// Hover
	hover = false; // Is the player using hover?
	hover_length = [210, 60]; // Duration
	state_unlocked[states.hover] = false; // Set to true when an armor unlocks this feature
	hover_toggle_mode = true;
	hover_mode = hover_modes.cancel_when_falling; // Mode
	hover_effect = [spr_x_hover_effect, noone];
	hover_effect_limit = 2;
	hover_vertical = true;
	hover_vertical_t = 0;
	hover_vertical_dir = -1;
	hover_vertical_limit = 6;
	hover_vertical_speed = 0.4;
	hover_neutral = true;
	hover_shoot_limit = 95;
	hover_shoot_inf = false;
	hover_effect_speed = 1;
	hover_effect_layer = effects.top;
	enum hover_modes {
		cancel_when_falling, keep_when_falling
	}

	hover_keep_dir = true; 
	hover_sound = snd_player_hover; // Sound
	hover_speed = walk_speed_default;
	// Effect
	effect_top = noone;
	effect_top_t = 0;
	effect_top_i = 0;
	effect_top_visible = false;

	// Effect
	effect_bottom = noone;
	effect_bottom_t = 0;
	effect_bottom_i = 0;
	effect_bottom_visible = false;

	// Fly
	state_unlocked[states.fly] = false;
	fly_vertical_speed = 0.4;
	fly_hspeed = 2;
	fly_length = 97;
	fly_vertical_t = 0;
	fly_vertical_limit = 6;
	fly_vertical_dir = -1;
	// Fly Effect (TOP)
	fly_effect = noone;
	fly_effect_speed = 0.5;
	fly_effect_limit = 4;
	// Effect 2 (BOTTOM)
	fly_effect2 = noone;
	fly_effect2_speed = 0.5;
	fly_effect2_limit = 4;

	// Dodge Roll
	dodge_roll_limit = 32;
	dodge_roll_speed = 3;
	// Dolor
	dolor = false; // Is the player getting dolor?
	dolor_jump = true; // Will the player jump when getting dolor?
	dolor_damage = 1; // Damage that will be done to the player
	dolor_sound = snd_player_dolor; // Sound
	dolor_animation = "dolor";
	damage_reduction = 0;

	// Defense Shield (X3 Armor)
	defense_shield_enabled = true;
	defense_shield_unlocked = false;
	defense_shield_limit = 305; // Time Limit
	defense_shield_inst = noone; // Instance
	defense_shield_sprite = spr_player_shield_blue; // Sprite
	defense_shield_damage_reduction = 0.75; // Damage Reduction when using the Defense Shield

	// Death
	death_sound = snd_player_death; // Sound
	death_orb_sprite = spr_x_death_orb;

	// Death Conditions
	death_by_spike = true;

	// Immunity
	visible = true;
	player_immunity_variables();
	
	// Ceil
	ceil_cling = false;
	ceil_cling_limit = 180;

	// High Jump
	state_unlocked[states.high_jump] = false;
	high_jump_strength = 10;
	high_jump_limit = 18;
	high_jump = false;

	// Glide
	glide = false
	state_unlocked[states.glide] = false;
	glide_hspeed = 2;
	glide_vspeed = 0.3;
	glide_end = false;

	// Giga
	giga_limit = [55, 173, 176];
	giga_sound = snd_player_x_giga_falcon;

	giga_crush_lines = player_effect_new(obj_player_giga_crush_lines, 0, 0, layer_up);
	giga_crush_after_lines = player_effect_new(obj_player_giga_crush_lines2, 0, 0, layer_up);
	giga_crush_rgb_array = [
		[66, 66, 66],
		[66, 66, 66],
		[82, 82, 82],
		[82, 82, 82],
		[99, 99, 99],
		[115, 115, 115],
		[132, 132, 132],
		[148, 148, 148],
		[156, 173, 181],
		[165, 198, 214],
		[173, 222, 247],
		[181, 247, 16],
		[189, 8, 49],
		[198, 33, 82],
		[206, 57, 115],
		[214, 82, 148],
		[222, 107, 181],
		[231, 132, 214],
		[239, 156, 247],
		[247, 181, 16],
		[255, 206, 49],
		[255, 231, 82],
		[255, 255, 115],
		[255, 16, 148],
		[255, 41, 181],
		[255, 66, 214],
		[255, 90, 247],
		[255, 115, 16],
		[255, 140, 49],
		[255, 165, 82],
		[255, 189, 115],
		[255, 214, 148],
		[255, 239, 181],
		[255, 0, 214],
		[255, 24, 247],
		[255, 49, 16],
		[255, 74, 49],
		[255, 99, 82],
		[255, 123, 115],
		[255, 148, 148],
		[255, 173, 181],
		[255, 198, 214],
		[255, 222, 247],
		[255, 247, 16],
		[255, 8, 49],
		[255, 33, 82],
		[255, 57, 115],
		[255, 82, 148],
		[255, 107, 181],
		[255, 132, 214],
		[255, 156, 247],
		[255, 181, 16],
		[255, 206, 49]
	];
	// Palette
	armor_palette_index = [0, 0, 0, 0, 0, 0];

	// Charge
	charge_palettes = [0, 1, 1, 2, 3, 3, 3, 3];

	weapon_cost_reduce_rate = 0;

	// Hitbox
	state_hitbox[states.dash] = spr_x_crouch_mask;
	state_hitbox[states.crouch] = spr_x_crouch_mask;
	state_hitbox_current = noone;

	// Stage Finish
	walking_to_x = false; // Only used in X1 Style
	ignore_walk_to_middle = false; // true = X2-X3, false = X1
	middle_x = 0;
	boss_complete_music = "";
	complete_next_state = states.outro;
	wait_state = states.complete;
	wait_state_t = 0;
	wait_state_limit = 7*60;
	teleport_outro_reset_weapon = true;
	
	ds_list_clear(special_input_list);
	player_special_weapons_variables();
}
function player_dash_variables() {
	// Dash
	dash = false; // Is the player dashing?
	dash_speed = 3.5; // Speed (pixels / frame)
	dash_dir = 1; // Direction
	dash_normal_length = 32; // Dash Normal Length
	dash_length = dash_normal_length; // Current Dash Length
	dash_tapped = false; // Was the dash activated using double tap?
	dash_sound = snd_player_dash; // Dash Sound
	dash_immunity = false; // Does the player Immunity have immunity when using dash? 
	dash_blink = false; // Does the player blink?
	
	// Dash - Double Tap
	dash_tap = false; // Check for double tap when key (left, right) is pressed
	dash_tap_t = 0; // Timer
	dash_tap_limit = 15; // Timer Limit
	dash_tap_dir = 0; // Direction of the last key pressed
	dash_tap_timers = [0, 0, 0, 0]; // Timers
	// Dash - Effects
	player_effect_clear();
	/// Spark
	dash_spark = player_effect_new(obj_player_dash_spark, -6, 16, layer_up);
	dash_spark_inst = noone; // Spark Object Instance
	/// Dust
	dash_dust = player_effect_new(obj_player_dash_dust, -7, 20, layer_up, 4, player_dash_dust);
	dash_dust.min_limit = 2; // Start creating dust in that frame
	dash_dust.max_limit = 22; // Stop creating dust in that frame	
	
	// Dash - End
	dash_end = false; // Is the dash at the end?
	
}
function player_dash_air_variables() {
	dash_air = false; // Is the player using Air Dash?
	dash_air_length = 18; // Dash Air Length
	dash_air_unlocked = false; // Set to true when an armor unlocks this feature
	dash_air_limit = 1; // How many air dashes can the player do?
	dash_air_count = 0; // How many dashes did the player use?
	dash_air_immunity = false; // Does the player Immunity have immunity when using air dash? 
	dash_air_blink = false; // Does the player blink when using air dash?
	// Dash Up
	dash_up = false; // Is the player using Up Air Dash?
	dash_up_length = 32; // Dash Air Length
	dash_up_unlocked = false; // Set to true when an armor unlocks this feature

	// Dash Up - Effects
	dash_up_spark = player_effect_new(obj_player_dash_spark_up, 2, 24, layer_up);
	
}
function player_immunity_variables() {
	immunity = false;
	immunity_list = ds_list_create();
	immunity_t = 0;
	immunity_length = 60;
	immunity_type = immunity_types.dolor;
	immortal = false;
	enum immunity_types
	{
		dolor, normal, spike, none
	}

	// Blink
	blink = false;
	blink_t = 0;
	blink_speed = 1;
	
}

