function shaders_init() {
	shaders = [
		shdr_palette_swap,
		shader_palette_light,
	];

	global.support_shaders = shaders_are_supported();

	for (var i = 0; i < array_length_1d(shaders); i++) {
		if (!shader_is_compiled(shaders[i])) {
			global.support_shaders = false;
		}
	}


}
