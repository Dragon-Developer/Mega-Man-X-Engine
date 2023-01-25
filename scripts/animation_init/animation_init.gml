// Needs refactoring: put all functions in one script called Animation
function animation_init() {
	animation = ""; // Current Animation
	animation_end = false;
	animation_frames = [];
	animation_sprite_name = "";
	animation_loop = [];
	animation_is_looping = false;
	animation_t = 0; // Timer
	animation_i = 0; // Image Index
	animation_frame_index = 0;
	animation_frame_index_start = -1;
	animation_frame_index_end = -1;
	animation_length = 0;
	animation_ignore_frame = 0;

	image_speed = 0;
	image_index_update = true;
	animation_end_destroy = false;
}
