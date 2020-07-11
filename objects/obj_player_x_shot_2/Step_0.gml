event_inherited();

var t = timer++;

if (t < 10) player_shot_pos_fix();
else if (t >= 10 && t <= 11) abs_hspeed = 4;
else if (t >= 12 && t <= 13) abs_hspeed = 5;
else if (t >= 14 && t <= 15) abs_hspeed = 6;
else if (t >= 16) abs_hspeed = 6.25;
h_speed = abs_hspeed * dir;

if (t == 10)
{
	animation_play("loop");	
}

animation_update();
image_index = animation_i;
scr_physics_update();