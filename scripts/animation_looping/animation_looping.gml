/// @description Looping Animation
/// @param loop_start
/// @param loop_end
function animation_looping() {
	var loop_start, loop_end;

	if (argument_count > 0) {
	    loop_start = argument[0];
	    loop_end = loop_start;
	}

	if (argument_count > 1) {
	    loop_end = argument[1];
	}

	if (animation_t > loop_end) {
	    animation_t = loop_start;
	}



}
