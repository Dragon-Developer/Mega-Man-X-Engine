event_inherited();

// Scripts
armor_script = player_x_armor;
variables_script = player_x_variables;

// Armor
LEGS = "x2";
HELM = "x2";
BODY = "x2";
ARMS = "x2";

// Load Armor Properties
player_load_armor();
// Get Weapon Offsets
player_x_weapon_offsets();
// Palette
palette_init(plt_x);