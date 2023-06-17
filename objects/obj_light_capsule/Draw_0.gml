/// @description Draw

d3d_set_fog(true, flashColour, 0, 0);
draw_self();
d3d_set_fog(false, c_white, 0, 0);
draw_sprite_ext(sprite_index,floor(image_index),x,y,1,1,0,c_white,alpha);

draw_sprite(column_sprite,floor(columnIndex),x,y);
if hologramIndex != -1 && hologramFlash != 0
    draw_sprite_ext(hologram_sprite,floor(hologramIndex),x,y,hologramXscale,1,0,c_white,1);