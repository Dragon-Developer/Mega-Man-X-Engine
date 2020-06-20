if (armor[P_LEG] == "x2")
{
	// Dash Fire Effect
	dash_dust.object = obj_player_x_dash_fire;
	dash_dust.min_limit = 0;
	dash_dust.max_limit = dash_length;
	
	// Air Dash
	dash_air_unlocked = true;
	dash_up_unlocked = true;

}

if (armor[P_BODY] == "x2")
{
	animation_add("dolor|dolor2",
	[
		0, 0,
		3, 1,
		5, 1,
		7, 2,
		9, 1,
		11, 2,
		13, 1,
		15, 2,
		17, 1,
		21, 2,
		22, 1,
		30, 0,
		32, 0
	]);
	dolor_jump = false;
}