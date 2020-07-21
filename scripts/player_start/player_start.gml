// Name
char_name = string_replace(object_get_name(object_index), "obj_player_", "");
my_character = player_get_char_id(char_name);

// Sprites
pl_sprite[P_FULL] = 0;

// Layers
layer_up = layer_create(layer_get_depth(layer) - 1);
layer_down = layer_create(layer_get_depth(layer) + 1);

// Camera
cam = instance_create_layer(x, y, layer_up, obj_camera);

// Ready
instance_create_layer(cam.mid_x, cam.mid_y, layer_up, obj_player_ready);

// Scripts
variables_script = noone;
armor_script = noone;

// Pos Start
x_start = x;
y_start = y;
locked = true;

// Animation
animation_init();
animations_init();
animation_script = player_x_animation;
animation_controller = player_x_animation_controller;

// Keys
scr_keys_reset();

// Health
max_health = 16;
my_health = max_health;

// Direction (1 = right, -1 = left)
dir = 1;
image_xscale = 1;

// Weapon
weapon_offset = ds_map_create(); // Weapon (X, Y) Offset

// Special Weapons
special_weapons = ds_list_create();

// Effects
effects_list = ds_list_create();

// Armor
armor[P_OG] = "";
armor[P_LEGS] = "";
armor[P_BODY] = "";
armor[P_ARMS] = "";
armor[P_HELM] = "";
armor[P_FULL] = "";

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
shoot_next_projectile = noone; // Object
shoot_next_wait = false; // Must the player wait the next animation to end to shoot again?
shoot_wait = false; // Must the player wait the current animation to end to shoot again?
shoot_cancel_on_wall = false; // Cancel animation if the player wall jump/slide?
shoot_type = shoot_types.normal; // Type
shoot_next_type = shoot_types.normal; // Type

enum shoot_types
{
	normal, special, special_floor_and_air, super_shot, nova_strike
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

// Weapon
enum weapon_styles
{
	snes, psx
}

enum weapons
{
	x_buster,
	z_saber,
	a_pistol
}

weapon[0] = weapons.x_buster; // Primary weapon
weapon[1] = noone; // Secondary weapon (Disabled in Snes Style)
weapons_script[weapons.x_buster] = player_x_buster_x2;

player_variables();