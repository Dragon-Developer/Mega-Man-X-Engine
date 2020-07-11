if (armor_is_full("x2"))
{	
	player_special_weapons_add(player_shoryuken);
	player_special_weapons_add(player_hadouken);
}

if (LEGS == "x2")
{
	// Dash Fire Effect
	/*
	dash_dust.object = obj_player_x_dash_fire;
	dash_dust.min_limit = 0;
	dash_dust.max_limit = dash_length;
	*/
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
	charge_level_max = 4;	
}