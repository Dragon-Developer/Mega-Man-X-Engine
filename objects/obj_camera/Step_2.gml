camera_follow_player();
audio_loop_update();

// Background Move
layer_x(back_layer_id, floor(camera_get_view_x(view_camera[0]) * 0.5));