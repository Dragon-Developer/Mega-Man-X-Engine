PAUSE;
timer++;
if (timer < 60)
	visible = !visible;
else
	visible = true;
if (timer > limit) {
	var part_sprites = spr_chill_penguin_particles;
	audio_play(snd_ice_destroy);
	for (var i = 0; i < sprite_get_number(part_sprites); i++) {
		var part_inst = instance_create_depth(x + 8, y + 16, depth, obj_particles);
		part_inst.sprite_index = part_sprites;
		part_inst.image_index = i;
		part_inst.v_speed = random_range(-2, 0);
		part_inst.h_speed = random_range(-2, 2);
	}
	instance_destroy();
}