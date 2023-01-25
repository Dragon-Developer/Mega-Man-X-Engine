// Needs refactoring: fade_out_and_fade_in is not working corretly
if ((transition_type == transition_types.fade_in && timer == 0)
|| (transition_type == transition_types.fade_out_and_fade_in && alpha == 1 && wait_timer > 0)
|| (transition_type == transition_types.fade_out && timer > transition_limit && wait_timer > 0)) {
	if (wait_timer-- > 0) exit;
}

var t = timer++;

if (t > transition_limit) {
	if (auto_destroy) instance_destroy();
	exit;
}
else {
	switch (transition_type) {
		case transition_types.fade_in:
		case transition_types.fade_out:
			alpha = lerp(alpha_start, alpha_end, t / transition_limit);
			break;
		case transition_types.fade_out_and_fade_in:
			var limit = transition_limit / 2;
			// Fade Out
			if (t <= limit) {
				alpha = t / limit;
			}
			// Fade In
			else {
				alpha = (transition_limit - t) / limit;
			}
			break;
		case transition_types.blink:
			alpha = (t mod blink_limit == 0);
			break;
		case transition_types.transparency:
			back_index += back_speed;
			break;
	}
}