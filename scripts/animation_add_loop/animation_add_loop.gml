/// @description Set the loop for the given animation
/// @param animation
/// @param first_frame
/// @param last_frame
function animation_add_loop() {
	if (argument_count > 0) {
		var _anim = argument[0];
		var _length = array_length(animations_frames[? _anim]);
		var frames = animations_frames[? _anim];
		var first_frame = (argument_count > 1) ? argument[1] : frames[0];
		var last_frame = (argument_count > 2) ? argument[2] : frames[_length - 2];
		animations_loop[? _anim] = [first_frame, last_frame];
	}


}
