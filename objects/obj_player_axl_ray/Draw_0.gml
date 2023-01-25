//event_inherited();
draw_self_fixed(sprite_index, image_index);
for (var i = 0; i < array_length(draw_fin); i++) {
	if (draw_fin[i])
		draw_self_fixed(sprite_index, image_index + i + 1);
}