// Needs refactoring and put all palette functions in one script called Palette
function palette_init() {
	// Offset uniform
	plt_index = 0;
	plt_index_default = 0;
	plt_source_index = 0;

	plt_width = 32;
	plt_texture = noone;

	if (!global.support_shaders) exit;

	v_offset = shader_get_uniform(shdr_palette_swap, "Offset");
	v_source_offset = shader_get_uniform(shdr_palette_swap, "OffsetSource");

	// Sampler and texture variables
	plt_swap_sampler = shader_get_sampler_index(shdr_palette_swap, "Palette");


}
