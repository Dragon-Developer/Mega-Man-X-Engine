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
crouch_t = 0;

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

// Double Jump
double_jump_unlocked = false;

// Fall
fall = false; // Is the player falling?
fall_t = 0; // Timer
fall_enabled = true; // Can the fall animation be played?
vspeed_max = 5.75; // Maximum Vertical Speed

// Land
land = false;
land_sound = snd_player_land; // Sound
land_enabled = true; // Can the land animation be played?

// Wall Slide
wall_slide = false; // Is the player sliding on the wall?
wall_slide_t = 0; // Timer
wall_slide_dir = 1; // Direction
wall_slide_enabled = true; // Can the player slide on the wall?
wall_slide_sound = snd_player_wall_slide; // Wall Slide Sound
wall_slide_animation_enabled = true; // Is the animation enabled?
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
wall_jump_animation_enabled = true; // Is the animation enabled?

// Wall Jump - Effect
wall_jump_spark = player_effect_new(obj_player_wall_jump_spark, 16, 20, layer_up);

// Hover
hover = false; // Is the player using hover?
hover_t = 0; // Timer
hover_length = 120; // Duration
//hover_dir = 1; // Direction
hover_enabled = true; // Can the player use hover?
hover_unlocked = false; // Set to true when an armor unlocks this feature
hover_toggle_mode = true;
hover_mode = hover_modes.cancel_when_falling; // Mode
hover_effect = noone;
hover_effect_t = 0;
hover_effect_i = 0;
hover_effect_limit = 2;
hover_effect_speed = 0.2;
hover_vertical = false;
hover_vertical_t = 0;
hover_vertical_dir = -1;
hover_vertical_limit = 6;
hover_vertical_speed = 0.4;

enum hover_modes
{
	cancel_when_falling, keep_when_falling
}

hover_keep_dir = false; 
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

// Special Input
special_input_init();
player_special_weapons_variables();