function scr_tile_begin(){
	if (event_type == ev_draw && event_number == 0 && global.support_shaders){
        shader_set(shdr_tile);
		shader_set_uniform_f(global.tile_shader_u_multiplier, global.tile_shader_multiplier);
    }
}