function player_saber_reset() {
	saber_atk = noone;
	saber_atk_current = noone;
	saber_state = noone;
	if (instance_exists(saber)) {
		saber.visible = false;	
		saber.destroy = true;
	}


}
