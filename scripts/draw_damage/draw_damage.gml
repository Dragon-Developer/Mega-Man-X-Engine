function draw_set_damage_effect(state) {
	if (state) {
		if (light > 0) {
			scr_shader_set(shader_palette_light);
			if (!global.support_shaders)
				gpu_set_fog(true, c_white, 0, 0);	
		}
	} else {
		shader_reset();
		if (light > 0 && !global.support_shaders) {
			gpu_set_fog(false, c_black, 0, 0);
		}
	}
}