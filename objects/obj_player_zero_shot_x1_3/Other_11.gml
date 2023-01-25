/// @description Step
event_inherited();
var t = timer++;

if (destroy)
{
	h_speed = 0;
}
else
{
	if (t < 3) player_shot_pos_fix();
	else {
		if (t == 3) {
			abs_hspeed = 2;
		}
		abs_hspeed += 0.5;
		abs_hspeed = min(abs_hspeed, abs_hspeed_max);

		h_speed = abs_hspeed * dir;
	}
}