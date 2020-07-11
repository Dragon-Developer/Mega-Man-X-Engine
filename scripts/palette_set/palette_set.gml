shader_set(shdr_palette_swap);

texture_set_stage(plt_swap_sampler, plt_texture);

shader_set_uniform_f(v_offset, plt_index / plt_width);