function player_saber_key_check() {
	if (saber_key == 1) {
		saber_key_h = key_shoot;
		saber_key_p = key_p_shoot;
		saber_key2_h = key_shoot2;
		saber_key2_p = key_p_shoot2;
	} else {
		saber_key_h = key_shoot2;
		saber_key_p = key_p_shoot2;
		saber_key2_h = key_shoot;
		saber_key2_p = key_p_shoot;
	}


}
