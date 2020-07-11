event_inherited();

var t = timer++;

if (t < 6) player_shot_pos_fix();
else if (t == 6) abs_hspeed = 4;
else if (t >= 7 && t <= 8) abs_hspeed = 5;
else if (t >= 9 && t <= 10) abs_hspeed = 6;
else if (t >= 11 && t <= 12) abs_hspeed = 7;
else if (t >= 13) abs_hspeed = 7.5;

h_speed = abs_hspeed * dir;

if (t == 6) animation_play("loop");	

animation_update();
image_index = animation_i;
scr_physics_update();