event_inherited();

var t = timer++;

if (t >= 0 && t <= 2) abs_hspeed = 4;
else if (t >= 3 && t <= 5) abs_hspeed = 5;
else if (t >= 6 && t <= 24) abs_hspeed = 6;
else abs_hspeed = 6.25;
h_speed = abs_hspeed * dir;

scr_physics_update();