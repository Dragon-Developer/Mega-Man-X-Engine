if (global.paused && global.pause_type != pause_types.door) exit;
local_game_speed_update();
if (!local_game_run_step) exit;
image_index += animation_speed;
if (image_index > image_number)
	image_index -= image_number;