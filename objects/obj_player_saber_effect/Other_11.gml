// Animation
var t = timer++;
if (t == 0) {
	visible = true;
	if (sprite_index == spr_saber_block_effect) {
		palette_texture_set(plt_saber);	
	}
}
if (animation_end) {
    instance_destroy();
    exit;
}

