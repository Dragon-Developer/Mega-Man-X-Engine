function player_weapon_settings() {
	enum weapons {
		// Default
		x_buster,
		z_buster,
		z_saber,
		a_pistol,
		vile_vulcan,
		mega_buster,
		// X
		storm_tornado,
		homing_torpedo,
		hyper_charge,
		falcon_giga,
		x2_giga_crush,
		nova_strike,
		// Zero
		messenko,
		z_buster_x5,
		// Axl
		a_ray_gun,
		// Mega Man
		copy_vision,
		speed_gear,
		dive_missile,
		lightning_bolt
	}
	// Must be changed to struct array
	for (var i = 80; i >= 0; i--) {
		weapon_palettes[i] = plt_index_default;
		weapon_icon[i] = noone;
		weapon_color[i] = 0;
		weapon_sprite_name[i] = "";
		weapon_shots_limit[i] = 1;
		weapon_show[i] = true;
		weapon_energy[i] = 28;
		weapon_energy_max[i] = 28;
		weapon_max_level[i] = 3;
		weapon_costs[i] = [1, 1, 1, 2, 2, 2];
		weapon_auto_charge[i] = false;
		weapon_damage_refill[i] = 0;
		weapon_fill_rate[i] = 0;
		weapons_script[i] = noone;
		weapon_selectable[i] = true;
		weapon_full_sound[i] = noone;
		weapon_refill_enabled[i] = true;
		weapon_level_id[i] = 0; // Use this for weapons that use the same script and only changes the shot or its properties
	}
	// Palettes
	weapon_palettes[weapons.storm_tornado] = 6;
	weapon_palettes[weapons.homing_torpedo] = 9;
	weapon_palettes[weapons.copy_vision] = 13;
	weapon_palettes[weapons.dive_missile] = 14;
	weapon_palettes[weapons.lightning_bolt] = 15;
	// Bar Icons
	weapon_icon[weapons.storm_tornado] = 0;
	weapon_icon[weapons.homing_torpedo] = 5;
	weapon_icon[weapons.messenko] = 1;
	weapon_icon[weapons.vile_vulcan] = 2;
	weapon_icon[weapons.hyper_charge] = 3;
	weapon_icon[weapons.falcon_giga] = 2;
	weapon_icon[weapons.x2_giga_crush] = 4;
	weapon_icon[weapons.nova_strike] = 2;
	weapon_icon[weapons.copy_vision] = 6;
	weapon_icon[weapons.dive_missile] = 7;
	weapon_icon[weapons.lightning_bolt] = 8;
	// Bar color (Image Index)
	weapon_color[weapons.storm_tornado] = 1;
	weapon_color[weapons.homing_torpedo] = 3;
	weapon_color[weapons.dive_missile] = 5;
	weapon_color[weapons.lightning_bolt] = 6;
	weapon_color[weapons.copy_vision] = 4;
	weapon_color[weapons.messenko] = 2;
	weapon_color[weapons.vile_vulcan] = 1;
	// Sprite Names
	weapon_sprite_name[weapons.a_pistol] = "pistol";
	weapon_sprite_name[weapons.a_ray_gun] = "ray";
	// Shots Limit
	weapon_shots_limit[weapons.x_buster] = 3;
	weapon_shots_limit[weapons.z_buster] = 3;
	weapon_shots_limit[weapons.a_pistol] = 200;
	weapon_shots_limit[weapons.a_ray_gun] = 200;
	weapon_shots_limit[weapons.vile_vulcan] = 10;
	weapon_shots_limit[weapons.hyper_charge] = 2;
	weapon_shots_limit[weapons.homing_torpedo] = 2;
	weapon_shots_limit[weapons.storm_tornado] = 1;
	weapon_shots_limit[weapons.mega_buster] = 3;
	weapon_shots_limit[weapons.copy_vision] = 4;
	weapon_shots_limit[weapons.dive_missile] = 1;
	weapon_shots_limit[weapons.lightning_bolt] = 1;
	// Show
	weapon_show[weapons.x_buster] = false;
	weapon_show[weapons.z_buster] = false;
	weapon_show[weapons.a_pistol] = false;
	weapon_show[weapons.z_saber] = false;
	weapon_show[weapons.mega_buster] = false;
	weapon_show[weapons.falcon_giga] = false;
	// Cost
	weapon_costs[weapons.x_buster] = [0];
	weapon_costs[weapons.z_buster] = [0];
	weapon_costs[weapons.z_buster_x5] = [0];
	weapon_costs[weapons.a_pistol] = [0];
	weapon_costs[weapons.a_ray_gun] = [0];
	weapon_costs[weapons.mega_buster] = [0];
	weapon_costs[weapons.messenko] = [7];
	weapon_costs[weapons.hyper_charge] = [4];
	weapon_costs[weapons.nova_strike] = [0];
	weapon_costs[weapons.falcon_giga] = [-1];
	weapon_costs[weapons.x2_giga_crush] = [-1];
	weapon_costs[weapons.speed_gear] = [(28/60) / 5]; // Use for 5 seconds
	weapon_costs[weapons.lightning_bolt] = [4];
	// Weapon Limit
	weapon_energy_max[weapons.vile_vulcan] = 16;
	// Max Level
	weapon_max_level[weapons.x_buster] = infinity;
	weapon_max_level[weapons.z_buster] = infinity;
	weapon_max_level[weapons.mega_buster] = infinity;
	weapon_max_level[weapons.hyper_charge] = 0;
	// Auto Charge
	weapon_auto_charge[weapons.hyper_charge] = true;
	// Refill by Hit
	weapon_damage_refill[weapons.hyper_charge] = 1;
	weapon_damage_refill[weapons.falcon_giga] = 4;
	weapon_damage_refill[weapons.x2_giga_crush] = 3;
	// Weapon Level ID
	weapon_level_id[weapons.a_ray_gun] = 1;
	// Fill Rate
	weapon_fill_rate[weapons.vile_vulcan] = 0.1;
	weapon_fill_rate[weapons.speed_gear] = (28/60) / 15;
	// Full Sound
	weapon_full_sound[weapons.x2_giga_crush] = snd_player_full_weapon;
	weapon_full_sound[weapons.falcon_giga] = snd_player_full_weapon;
	weapon_full_sound[weapons.speed_gear] = noone;
	// Selectable
	weapon_selectable[weapons.z_saber] = false;
	weapon_selectable[weapons.nova_strike] = false;
	weapon_selectable[weapons.falcon_giga] = false;
	weapon_selectable[weapons.speed_gear] = false;
	// Scripts
	weapons_script[weapons.x_buster] = player_x_buster_x2;
	weapons_script[weapons.z_buster] = player_zero_buster_x1;
	weapons_script[weapons.storm_tornado] = player_x_storm_tornado;
	weapons_script[weapons.homing_torpedo] = player_x_homing_torpedo;
	weapons_script[weapons.a_pistol] = player_axl_pistol;
	weapons_script[weapons.a_ray_gun] = player_axl_pistol;
	weapons_script[weapons.vile_vulcan] = player_vile_vulcan;
	weapons_script[weapons.hyper_charge] = player_x_hyper_charge;
	weapons_script[weapons.mega_buster] = player_megaman_buster;
	weapons_script[weapons.copy_vision] = player_megaman_copy_vision;
	weapons_script[weapons.dive_missile] = player_megaman_dive_missile;
	weapons_script[weapons.lightning_bolt] = player_megaman_lightning_bolt;
	weapons_script[weapons.z_buster_x5] = player_zero_buster_x5;
}
