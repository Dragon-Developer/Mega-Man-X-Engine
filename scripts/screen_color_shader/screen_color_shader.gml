function screen_color_shader() {
	if (!screen_color_default_mode && !global.support_shaders) exit;

	shader_set(shdr_color_effect);
	shader_set_uniform_f(offset_r, offset_rgb[0]);
	shader_set_uniform_f(offset_g, offset_rgb[1]);
	shader_set_uniform_f(offset_b, offset_rgb[2]);


}
