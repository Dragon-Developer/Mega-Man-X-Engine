function player_state_messenko() {
	var t = state_timer++;
	if (t == 0)
		player_activate_immunity(immunity_types.normal);
	if (t < 26) {
		animation_play("messenko", t);	
	}

	if (t == 26) {
		audio_play(snd_player_punch_ground);
		for (var i = 0; i < 9; i++) {
			var inst = player_shoot_projectile(obj_player_zero_messenko);
			var angle = 22.5 * i;
			inst.angle = angle;
			inst.image_angle = angle;
			inst.x += lengthdir_x(16, angle);
			inst.y += lengthdir_y(16, angle) + 16;
		}
		shoot_update_position = false;
	}

	if (animation_end) {
		player_check_idle();
		player_check_fall();
		using_special_weapon = false;
		player_weapon_select(weapon_previous);
	}

	player_charge_reset();
	player_saber_reset();

}
