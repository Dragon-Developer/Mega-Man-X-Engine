function player_effect_layer() {
	var _layer = argument[0];
	if (_layer == effects.top) {
		player_effect_top(argument[1], argument[2], argument[3], argument[4]);	
	} else {
		player_effect_bottom(argument[1], argument[2], argument[3], argument[4]);	
	}


}
