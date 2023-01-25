if (light>0)
{           
        shader_set(shader_palette_light);      
        draw_sprite_ext(sprite_index,floor(image_index),x,y,xscale,yscale,0,c_white,1);
        shader_reset();
    light--;
}
else
    draw_sprite_ext(sprite_index,floor(image_index),x,y,xscale,yscale,0,c_white,1);


//if (global.isdebug)
   // draw_sprite_ext(mask_index,0,x,y,1,1,0,c_white,0.8);