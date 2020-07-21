// Default
palette_init(plt_x);

special_weapons = ds_list_create();
weapons_script[weapons.x_buster] = player_x_buster_x2;
charge_level_max = 2;

if (FULL == "ult")
{
	// Intro
	intro_end_sound = snd_player_intro_end;
	// Dolor
	dolor_animation = "dolor2";
	// Buster
	charge_level_max = 3;
	// Air Dash
	dash_air_unlocked = true;
	dash_up_unlocked = true;
	// Hover
	hover_unlocked = true;
	hover_keep_dir = true;
	hover_mode = hover_modes.cancel_when_falling;
	hover_effect = spr_x_hover_effect;
	hover_vertical = true;
	hover_speed = walk_speed_default;
	hover_effect_speed = 1;
	// Special Weapon
	player_special_weapons_add(player_nova_strike);
	// Palette
	palette_init(plt_x_ultimate);
	// X-Buster
	weapons_script[weapons.x_buster] = player_x_buster_x4;
}

if (armor_is_full("x2"))
{	
	player_special_weapons_add(player_shoryuken);
	player_special_weapons_add(player_hadouken);
}

if (LEGS == "x2")
{
	// Air Dash
	dash_air_unlocked = true;
	dash_up_unlocked = true;
}

if (BODY == "x2")
{
	dolor_animation = "dolor2";
	dolor_jump = false;
}

if (ARMS == "x2")
{
	weapons_script[weapons.x_buster] = player_x_buster_x2;
	charge_level_max = 4;	
}

if (LEGS == "fire")
{
	// Dash Fire Effect
	dash_dust.object = obj_player_x_dash_fire;
	dash_dust.min_limit = 0;
	dash_dust.max_limit = dash_length;
}