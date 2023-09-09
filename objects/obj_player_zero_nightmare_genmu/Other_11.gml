/// @description Step
event_inherited();
var t = timer++;
if (t == 0) {
	depth -= 10;
	x += 16*dir;
	y -= 56;
	h_speed = dir * abs_speed;
} else {
	can_hit = true;	
}
if (!animation_ignore_frame)
	visible = !visible;