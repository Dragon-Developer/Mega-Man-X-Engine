event_inherited();
persist = true;
is_boss = true;
is_active = false;
using_world_speed = false;
phy_type = phy_types.NEW;
gravity_default = 0.25;
hp = 0; // Initial Health
max_hp = 32; // Max Health
t = 0; // Timer
enum boss_states {
	intro = 100,
	idle = 101,
	jump = 102,
	fall = 103,
	land = 104,
	dash = 105,
	dolor = 106,
	death = 107,
}

intro = true;
jump_strength = 9;
jump_to_player = true;

idle_time_to_turn = 0;
idle_limit = 60;
idle_desperate_limit = 30;
jump_wait = 0;
dash_wait = 0;
dash_limit = 60;
death_animation = "death";

floor_state = -1; // State to jump back to floor
floor_y = 0;

through_walls = true;
activate_collision = true;
activate_collision_t = 0;
activate_collision_limit = 16;

distance_x = 0;
dash_speed = 9;
dash_friction = 0.0625;
dash_bounce = true;

skip_complete_walk = false; // Skip walking after defeating the boss

// Attacks list
attacks_list = ds_list_create();
ds_list_add(attacks_list,
	boss_states.jump,
	boss_states.dash
);
// Limit attack repetition
attack_limit = ds_map_create();
attack_limit[? boss_states.jump] = 1;
attack_limit[? boss_states.dash] = 1;
previous_attack = -1;
last_attack_count = 0;

// Attack Usage Properties           // cost > recover_rate
attack_properties = ds_map_create(); // [cost, recover_rate]
attack_properties[? boss_states.jump] = [3/4, 1/4];
attack_properties[? boss_states.dash] = [3/4, 1/4];

attack_energy = ds_map_create();
for (var k = ds_map_find_first(attack_properties); !is_undefined(k); k = ds_map_find_next(attack_properties, k)) {
	attack_energy[? k] = 1; // Initial energy for each attack
}

// Attack Object Condition
attack_object_condition = ds_map_create();
// Desperate
hp_desperate = 12;
desperate = false;
desperate_attacks = ds_list_create();
// The boss can't be hit in the shielded states
shielded_states = ds_map_create();
bar = noone;

// Themes
boss_battle_theme = "BossBattle";
play_theme = "";
// Palette
plt_index = 0;
anim[0] = false;

local_game_speed = 1;