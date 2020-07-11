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
player_variables();