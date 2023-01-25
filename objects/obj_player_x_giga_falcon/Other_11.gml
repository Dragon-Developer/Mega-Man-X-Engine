/// @description Step
event_inherited();

var t = timer++;

abs_vspeed += 0.5;
abs_vspeed = min(abs_vspeed, 7);

v_speed = abs_vspeed * dir;