function palette_texture_set() {
	if (global.support_shaders) {
		plt_texture_sprite = argument[0];
		plt_texture = sprite_get_texture(argument[0], 0);
	}


}
