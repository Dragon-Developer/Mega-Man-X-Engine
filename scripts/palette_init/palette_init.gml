// Offset uniform
plt_index = 0;

v_offset = shader_get_uniform(shdr_palette_swap, "Offset");

//plt_width = sprite_get_width(argument[0]);
plt_width = 32;
// Sampler and texture variables
plt_swap_sampler = shader_get_sampler_index(shdr_palette_swap, "Palette");
plt_texture = sprite_get_texture(argument[0], 0);