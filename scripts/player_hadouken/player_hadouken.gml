if (!hadouken_enabled) exit;

var change_state = -1;

if (hadouken_unlocked && !hadouken && is_on_floor() && special_input_pressed(hadouken_input))
{
	hadouken = true;
	change_state = false;
	animation_play("hadouken");
}

if (hadouken)
{
	var t = hadouken_t ++;
	if (t == 18)
	{
		player_shoot_projectile(obj_player_x_shot_hadouken)	
		audio_play(hadouken_sound);
	}
	if (t >= hadouken_limit)
	{
		hadouken = false;
		hadouken_t = 0;
		change_state = true;
	}
}

if (change_state > -1)
{
	idle_enabled = change_state;
	walk_enabled = change_state;
	dash_enabled = change_state;
	jump_enabled = change_state;
	land_enabled = change_state;
	fall_enabled = change_state;
	wall_slide_enabled = change_state;
	wall_jump_enabled = change_state;
	shoot_enabled = change_state;
	charge_enabled = change_state;
	shoryuken_enabled = change_state;
	dash = false;
	dash_tap = false;
}