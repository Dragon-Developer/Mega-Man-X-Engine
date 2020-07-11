// Start
intro = false; // Starting Teleport
intro_t = 0; // Timer
intro2 = false; // Starting in the Ground
intro2_t = 0; // Timer
intro_sound = snd_player_intro;
intro_animation = "intro"; // Unarmored part
intro_end_animation = ""; // Armored part
intro_end_sound = snd_player_intro_end; // Sound 

// Animation
player_animations();
animation_play("idle");
image_speed = 0;

// Idle
idle = true;
idle_enabled = true; // Can the idle animation be played?

// Crouch
crouch = false;
crouch_enabled = true;
crouch_unlocked = true;

// Walk
walk = false; // Is the player walking?
walk_speed_default = 1.5; // Speed (pixels / frame)
walk_speed = walk_speed_default; // Current Walk Speed
walk_enabled = true; // Can the player walk?
walk_ignore_dir = false; // Ignore the walk direction?
walk_ignore_move = false; // Ignore the walk movement?

// Dash
dash = false; // Is the player dashing?
dash_t = 0; // Timer
dash_speed = 3.5; // Speed (pixels / frame)
dash_dir = 1; // Direction
dash_normal_length = 32; // Dash Normal Length
dash_length = dash_normal_length; // Current Dash Length
dash_enabled = true; // Can the player dash?
dash_unlocked = true; // Set as true when the armor unlocks this feature
dash_tapped = false; // Was the dash activated using double tap?
dash_sound = snd_player_dash; // Dash Sound

// Dash - Double Tap
dash_tap = false; // Check for double tap when key (left, right) is pressed
dash_tap_t = 0; // Timer
dash_tap_limit = 15; // Timer Limit
dash_tap_dir = 0; // Direction of the last key pressed

// Dash - Effects
player_effect_clear();
/// Spark
dash_spark = player_effect_new(obj_player_dash_spark, -6, 16, layer_down);
dash_spark_inst = noone; // Spark Object Instance
/// Dust
dash_dust = player_effect_new(obj_player_dash_dust, -7, 20, layer_up, 4, player_dash_dust);
dash_dust.min_limit = 2; // Start creating dust in that frame
dash_dust.max_limit = 22; // Stop creating dust in that frame

// Dash - Air Dash
dash_air = false; // Is the player using Air Dash?
dash_air_length = 18; // Dash Air Length
dash_air_unlocked = false; // Set to true when an armor unlocks this feature
dash_air_limit = 1; // How many air dashes can the player do?
dash_air_count = 0; // How many dashes did the player use?

// Dash Up
dash_up = false; // Is the player using Up Air Dash?
dash_up_length = 32; // Dash Air Length
dash_up_unlocked = false; // Set to true when an armor unlocks this feature

// Dash Up - Effects
dash_up_spark = player_effect_new(obj_player_dash_spark_up, 2, 24, layer_up);

// Dash - End
dash_end = false; // Is the dash at the end?
dash_end_t = 0; // Timer

// Jump
jump = false; // Is the player jumping?
jump_strength = 5; // Initial Vertical Speed
jump_enabled = true; // Can the player jump?
jump_sound = snd_player_jump; // Jump Sound
jump_t = 0 // Timer
jump_animation_enabled = true; // Is the jump animation enabled?

// Fall
fall = false; // Is the player falling?
fall_enabled = true; // Can the fall animation be played?
vspeed_max = 5.75; // Maximum Vertical Speed

// Land
land_sound = snd_player_land; // Sound
land_enabled = true; // Can the land animation be played?

// Gravity
gravity_default = 0.25;
scr_physics_init(gravity_default);

// Wall Slide
wall_slide = false; // Is the player sliding on the wall?
wall_slide_t = 0; // Timer
wall_slide_dir = 1; // Direction
wall_slide_enabled = true; // Can the player slide on the wall?
wall_slide_sound = snd_player_wall_slide; // Wall Slide Sound

// Wall Slide - Effects
/// Dust
wall_slide_dust = player_effect_new(obj_player_wall_slide_dust, -16, 16, layer_up, 4, player_wall_slide_dust);

// Wall Jump
wall_jump = false; // Is the player jumping on the wall?
wall_jump_t = 0; // Timer
wall_jump_dir = 1; // Direction
wall_jump_strength = 5; // Initial Vertical Speed
wall_jump_enabled = true; // Can the player jump on the wall?
wall_jump_reset_gravity = false; // Set to true when the player is on the ceiling to ignore gravity

// Wall Jump - Effect
wall_jump_spark = player_effect_new(obj_player_wall_jump_spark, 16, 20, layer_up);

// Hover
hover = false; // Is the player using hover?
hover_t = 0; // Timer
hover_length = 120; // Duration
hover_dir = 1; // Direction
hover_enabled = true; // Can the player use hover?
hover_unlocked = false; // Set to true when an armor unlocks this feature
hover_mode = 0; // Mode 0 = Stop animation when falling, Mode 1 = Keep animation when falling
hover_sound = snd_player_hover; // Sound
hover_speed = 2; // Speed

// Dolor
dolor = false; // Is the player getting dolor?
dolor_t = 0; // Timer
dolor_jump = true; // Will the player jump when getting dolor?
dolor_damage = 1; // Damage that will be done to the player
dolor_sound = snd_player_dolor; // Sound
dolor_animation = "dolor";

// Immunity
immunity = false;
immunity_t = 0;
immunity_length = 60;
immunity_type = immunity_types.dolor;

enum immunity_types
{
	dolor	
}

// Blink
blink = false;
blink_t = 0;
blink_speed = 1;

// Shoot
shoot = false; // Is the player shooting
shoot_t = 0; // Timer
shoot_animation = ""; // Animation
shoot_limit = 15; // Timer Limit
shoot_enabled = true; // Is shot enabled?
shoot_unlocked = true; // Does this player shoot?
shoot_next_animation = ""; // Next Animation
shoot_at_time = 8; // Shoot at frame ?
shoot_projectile = noone; // Object
shoot_next_wait = false; // Must the player wait the next animation to end to shoot again?
shoot_wait = false; // Must the player wait the current animation to end to shoot again?
shoot_cancel_on_wall = false; // Cancel animation if the player wall jump/slide?
shoot_type = shoot_types.normal; // Type

enum shoot_types
{
	normal, special, special_floor_and_air	
}

// Shot
shot_id = 0;
shots_count = 0;
shots_limit = 3;

// Charge
charge = false; // Is the player charging a shot?
charge_t = 0; // Timer
charge_i = 0; // Image Index of Charge Sprite
charge_level = -1; // Current Charge Level
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
charge_palettes = [0, 1, 1, 2, 3]; // All Charge Palettes
charge_palette = 0; // Current Charge Palette
charge_blink = false; // Is the Charge Blinking (Swapping Palette every few frames)
charge_blink_t = 0; // Timer
charge_sound = snd_player_charge; // Charge Sound
charge_enabled = true; // Is the Charge enabled?

// Special Input
special_input_init();

// Shoryuken
shoryuken = false;
shoryuken_enabled = true;
shoryuken_unlocked = false;
shoryuken_t = 0;
shoryuken_effect = player_effect_new(obj_player_shoryuken_effect, 5, 0, layer_down);
shoryuken_jump_strength = 8;
shoryuken_limit = 41;
shoryuken_hspeed = 6.5;
shoryuken_input = special_input_new([RIGHT, DOWN, DOWN_RIGHT, SHOOT_1],
									[LEFT, DOWN, DOWN_LEFT, SHOOT_1]);
shoryuken_sound = snd_player_x_shoryuken;

// Hadouken
hadouken = false;
hadouken_enabled = true;
hadouken_unlocked = false;
hadouken_t = 0;
hadouken_input = special_input_new([DOWN, DOWN_RIGHT, RIGHT, SHOOT_1],
									[DOWN, DOWN_LEFT, LEFT, SHOOT_1]);
hadouken_limit = 42;
hadouken_sound = snd_player_x_hadouken;

// Weapon
enum weapon_styles
{
	snes, psx
}

//weapon_style = weapon_styles.snes;

enum weapons
{
	x_buster,
	z_saber,
	a_pistol
}

weapon[0] = weapons.x_buster; // Primary weapon
weapon[1] = noone; // Secondary weapon (Disabled in Snes Style)
weapons_script[weapons.x_buster] = player_x_buster_x2;