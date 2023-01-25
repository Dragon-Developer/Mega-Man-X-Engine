function animations_destroy() {
	if (ds_exists(animations_frames, ds_type_map)) ds_map_destroy(animations_frames);
	if (ds_exists(animations_loop, ds_type_map)) ds_map_destroy(animations_loop);
	if (ds_exists(animations_sprite_name, ds_type_map)) ds_map_destroy(animations_sprite_name);



}
