function scr_fade_explosion() {
	var fade = instance_create_layer(x, y, layer, par_enemy_fade);
	fade.sprite_index = sprite_index;
	fade.image_speed = 0;
	fade.image_xscale = xscale;
}
