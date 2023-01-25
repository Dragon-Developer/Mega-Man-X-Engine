/// @description Step
event_inherited();

var t = timer++;

if (t >= 0 && t <= 2) abs_speed = 4;
else if (t >= 3 && t <= 5) abs_speed = 5;
else if (t >= 6 && t <= 24) abs_speed = 6;
else abs_speed = 6.25;
h_speed = dir * lengthdir_x(abs_speed, dir_angle);
v_speed = lengthdir_y(abs_speed, dir_angle);