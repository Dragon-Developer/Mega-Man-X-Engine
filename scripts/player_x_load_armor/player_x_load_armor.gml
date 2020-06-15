if (armor[P_LEG] == "x2")
{
	// Dash Fire Effect
	dash_dust.object = obj_player_x_dash_fire;
	dash_dust.min_limit = 0;
	dash_dust.max_limit = dash_length;
	
	// Air Dash
	dash_air_unlocked = true;
	dash_air_limit = 1;
}

