if (light > 0)
{            
        shader_set(shader_palette_light);      
        draw_sprite_ext(sprite_index,floor(image_index),x,y,image_xscale,1,0,c_white,1);
        shader_reset();
    light--;
}
else
    draw_sprite_ext(sprite_index,floor(image_index),x,y,image_xscale,1,0,c_white,1);
