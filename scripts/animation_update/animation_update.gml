function animation_update(image_index_update = false) {
	if (animation_ignore_frame) {
		animation_ignore_frame--;
		exit;
	}
	var is_loop = false;
	animation_is_looping = false;
	if (array_length(animation_loop)) {
		is_loop = true;
		animation_looping(animation_loop[0], animation_loop[1]);
		if (animation_t >= animation_loop[0] && animation_t <= animation_loop[1]) {
			animation_is_looping = true;	
		}
		if (animation_frame_index_start != -1) {
			if (animation_t == animation_loop[0])
				animation_frame_index = animation_frame_index_start;
		}
	}
	for (var i = animation_frame_index; i < array_length(animation_frames); i += 2) {
		if (animation_t >= animation_frames[i]) {
			animation_i = animation_frames[i + 1];
			animation_frame_index = i;
		
			if (animation_t == animation_frames[i]) break;
		} else break;
	
		if (!is_loop && (i >= array_length(animation_frames) - 2)) {
			if (animation_t > animation_frames[i]) {
				animation_t = -1;
				animation_frame_index = 0;
				animation_frame_index_start = -1;
				animation_frame_index_end = -1;
				animation_end = true;
				break;
			}
		}
	}
	if (image_index_update)
		image_index = animation_i;
	animation_t++;
}
