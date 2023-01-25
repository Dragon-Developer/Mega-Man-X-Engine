function player_wall_slide_dust() {
	if (!instance_exists(wall_slide_dust)) exit;

	if (wall_slide_dust.timer >= wall_slide_dust.timer_limit)
		wall_slide_dust.timer = 0;

	if (wall_slide_dust.timer == 0) {
	    var inst = player_effect_create(wall_slide_dust);
		if (instance_exists(inst)) {
			inst.x += irandom_range(2, -1) * dir;
		}
	}

	wall_slide_dust.timer++;



}
