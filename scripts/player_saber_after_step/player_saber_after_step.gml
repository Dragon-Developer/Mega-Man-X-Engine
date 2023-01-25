function player_saber_after_step() {
	if (saber_atk == noone)
		saber_atk_current = noone;	
	saber_atk_current = saber_atk;
	if (saber_atk_current != noone && substates[0] == 0) {
		if (saber_mask[saber_atk_current] != noone) {
			saber.mask_index = saber_mask[saber_atk_current];	
		} else {
			saber.mask_index = saber.sprite_index;	
		}
		saber.atk = saber_damage[saber_atk_current];
		var interval = saber_hitstun_interval[saber_atk_current];
		var t = state_timer - 1;
		if (t == interval[0] || (interval[2] > 1 && interval[0] <= t && t <= interval[1])) {
			saber.destroy = false;
			saber.melee_activated = (interval[2] != 1);
		}
	} else {
		saber.destroy = true;	
	}

	if (saber_atk != noone && state_timer == 1) {
		saber_slash = true;
		saber_slash_sprite = saber_slash_sprites[saber_effects[saber_atk]];
	}


}
