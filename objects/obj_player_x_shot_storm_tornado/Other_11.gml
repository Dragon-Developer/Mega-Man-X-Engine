/// @description Step
event_inherited();

if (physics_ignore_frame) exit;
var t = timer++;
visible = t mod 2;
if (t mod 8 == 0 && t <= 56) image_xscale += dir;
if (t <= 56) animation_i = t div 2;
if (t == 56) animation_play("L");
if (t >= 56) {
	animation_update(true);
	abs_hspeed = 8;
}
h_speed = abs_hspeed * dir;