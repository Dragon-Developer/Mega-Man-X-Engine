function player_effect_bottom() {
	var _speed = argument[1];
	var _limit = argument[2];
	var index = argument[3];
	var tt = effect_bottom_t++;

	effect_bottom = argument[0];
	effect_bottom_i = floor(index) * (_limit + 1) + (tt *_speed);
	effect_bottom_visible = true;
			
	if ((tt * _speed) >= _limit + 1)
	{
		effect_bottom_t = 0;		
		effect_bottom_i = floor(index) * (_limit + 1);
	}



}
