enum drill_bird { move, turn}
#region States
var t = state_timer++;
switch (state) {
	case drill_bird.move:
		animation_play("M");
		if (position >= length || position <= 0) {
			state_set(drill_bird.turn);
		} else {
			position += dir;	
		}
		if (position <= 15) {
		    h_speed = position * speed_rate + 0.5;
		} else if (length - position <= 15) {
		    h_speed = (length - position) * speed_rate + 0.5;
		} else {
			h_speed = 15 * speed_rate + 0.5;
		}
		h_speed *= dir;
		xscale = -dir;
		break;
	case drill_bird.turn:
		animation_play("T");
		h_speed = 0;
		if (position >= length || position <= 0) {
			position -= dir;
		}
		else if (t == 3) {
			xscale = dir;	
		}
		else if (t >= 6) {
			state_set(drill_bird.move);
			dir *= -1;
		}
		break;
}
#endregion

