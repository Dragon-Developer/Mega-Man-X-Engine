/// @description Step
event_inherited();

var t = timer++;

if (t == 8) {
	abs_hspeed = 3;	
}
else if (t > 8) {
	abs_hspeed += 0.5;
}
abs_hspeed = min(abs_hspeed, abs_hspeed_max);
h_speed = abs_hspeed * dir;