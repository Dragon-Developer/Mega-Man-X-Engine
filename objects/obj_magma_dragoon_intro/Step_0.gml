var t = animation_t;
plt_index = 0;
ball = false;
if (animation != "") {
	if (t >= 29 && t <= 70) {
		ball = true;
		ball_i = (t - 29) mod 4;
		if (t mod 4 < 2) {
			plt_index = 3;	
		}
	}
}
event_inherited();