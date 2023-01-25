function player_charge_reset() {
	shoot = false;
	shoot_t = 0;
	shoot_type = shoot_types.normal;
	shoot_animation = "";
	shoot_next_animation = "";
	// Use this to reset the Charge Level
	charge = false;
	charge_sprite = noone;
	charge_t = 0;
	charge_level = -1;
	shot_id = 0;
	audio_stop(charge_sound);


}
