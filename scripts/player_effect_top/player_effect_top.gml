function player_effect_top() {
	var _speed = argument[1];
	var _limit = argument[2];
	var index = argument[3];
	var tt = effect_top_t++;

	effect_top = argument[0];
	effect_top_i = floor(index) * (_limit + 1) + (tt *_speed);
	effect_top_visible = true;
			
	if ((tt * _speed) >= _limit + 1)
	{
		effect_top_t = 0;		
		effect_top_i = floor(index) * (_limit + 1);
	}



}
