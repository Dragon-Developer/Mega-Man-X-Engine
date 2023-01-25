function player_effect_destroy() {
	if (argument[0] == noone) return noone;
	with (argument[0]) {
	    instance_destroy();
	}
	return noone;



}
