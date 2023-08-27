/// @description Step
event_inherited();/*
if (animation_ignore_frame <= 0)
	image_index += 1 / 3;
else
	animation_ignore_frame--;
	*/
var t = timer++;

if (t == 0) {
	v_speed = -abs_speed;
	image_xscale = 1;
}