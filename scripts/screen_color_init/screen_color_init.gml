// Needs refactoring: put all functions in one script
function screen_color_init() {
	offset_r = shader_get_uniform(shdr_color_effect, "OffsetR");
	offset_g = shader_get_uniform(shdr_color_effect, "OffsetG");
	offset_b = shader_get_uniform(shdr_color_effect, "OffsetB");

	offset_rgb = [0, 0, 0];
	screen_color_default_mode = true;


}
