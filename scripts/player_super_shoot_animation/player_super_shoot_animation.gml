function player_super_shoot_animation() {
	if (state == states.dolor) exit;
	if (state == states.idle || state == states.crouch)
	{
		shoot_next_animation = "super_shoot";
		shoot_next_type = shoot_types.super_shot;
		if (state == states.crouch)
		{
			shoot_next_type = shoot_types.super_shot_crouch;
		}
		shoot_limit = 41;
		shoot_next_projectile = noone;
	}


}
