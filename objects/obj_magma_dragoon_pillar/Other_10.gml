var t = timer++;
if (t == 0)
	audio_play(snd_magma_dragoon_pillar1);
if (t < 120) {
	y -= 4;
	image_index -= 1/4;
}
if (t >= 120) {
	y += 4;
	image_index += 1/4;
	if (y >= base_y) {
		instance_destroy();
		exit;
	}
}