if (is_inside_view()) {
	instance_create_depth(x,y,depth-1,explode_FX);
	audio_play(exploding);
}
room_speed = 60;