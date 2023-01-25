function player_gravity() {
	iof = is_on_floor();
	if (iof) {
	    grav = 0;
	} else {
	    grav = gravity_default;
		in_air = 1;
	}



}
