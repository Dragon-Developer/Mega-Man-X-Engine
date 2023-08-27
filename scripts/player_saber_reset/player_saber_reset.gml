function player_saber_reset(change_saber = true) {
	saber_atk = noone;
	saber_atk_current = noone;
	saber_state = noone;
	if (instance_exists(saber) && change_saber) {
		saber.visible = false;	
		saber.destroy = true;
	}


}
