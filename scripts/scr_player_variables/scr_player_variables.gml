// Name
char_name = "x";

// Sprites
pl_sprite[P_FULL] = 0;

// Layers
layer_up = layer_create(layer_get_depth(layer) - 1);
layer_down = layer_create(layer_get_depth(layer) + 1);

// Camera
cam = instance_create_layer(x, y, layer_up, obj_camera);

// Ready
instance_create_layer(cam.mid_x, cam.mid_y, layer_up, obj_player_ready);

// Start
start = false; // Starting Teleport
start_t = 0; // Timer
start2 = false; // Starting in the Ground
start2_t = 0; // Timer
start_sound = snd_player_start;
x_start = x;
y_start = y;
locked = true;

// Keys
scr_keys_start();

// Health
max_health = 16;
my_health = max_health;

// Direction (1 = right, -1 = left)
dir = 1;
image_xscale = 1;

// Animation
animation_init();
animation_script = scr_x_animation; // Script
animations_init();
player_animations();
animation_play("idle");
image_speed = 0;

// Idle
idle = true;
idle_enabled = true; // Can the idle animation be played?

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

// Weapon
weapon = ""; // ...

// Armor
armor[P_OG] = "";
armor[P_LEG] = "";
armor[P_BODY] = "";
armor[P_ARM] = "";
armor[P_HELM] = "";
armor[P_FULL] = "";