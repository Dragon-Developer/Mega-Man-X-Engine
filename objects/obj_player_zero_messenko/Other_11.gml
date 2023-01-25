/// @description Step
event_inherited();/*
if (animation_ignore_frame <= 0)
	image_index += 1 / 3;
else
	animation_ignore_frame--;
	*/
var t = timer++;

if (t == 0) {
	h_speed = lengthdir_x(abs_speed, angle);
	v_speed = lengthdir_y(abs_speed, angle);
	image_xscale = 1;
}