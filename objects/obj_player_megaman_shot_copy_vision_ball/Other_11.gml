/// @description Step
event_inherited();

if (dash) {
/*	if (global.dash_lemon_visible)
		sprite_index = spr_x_shot_11;
	else sprite_index = spr_megaman_shot_1;*/
	if (ds_exists(boss_damage, ds_type_map))
		boss_damage[? noone] = 2;
	atk = 2;
}

if (destroy)
{
	var t = destroy_t - 1;
	if (blocked_reflect && blocked && (t <= 1))
	{
		x = xprevious;
		y = yprevious;
		h_speed = -6 * dir;
		v_speed = -3;
		if (dash)
		{
			grav = 0.25;
		}
	}
}
else
{
	var t = timer++;
	if (t >= 0 && t <= 2) abs_hspeed = 4;
	else if (t >= 3 && t <= 5) abs_hspeed = 5;
	else if (t >= 6 && t <= 24) abs_hspeed = 6;
	else abs_hspeed = 6.25;
	h_speed = abs_hspeed * dir;
}
