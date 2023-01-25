/// @description Step
event_inherited();

if (destroy)
{
	h_speed = 0;
	/*
	if (destroy_t == 1)
	{
		if (!blocked) animation_play("D");
		else animation_play("B");
	}
	if (animation_end)
	{
		instance_destroy();
		exit;
	}*/
}
else
{
	var t = timer++;
	if (t == 0) audio_play(sound);
	if (t < 5) player_shot_pos_fix();
	else if (t == 5) abs_hspeed = 5;
	else if (t >= 6 && t <= 8) abs_hspeed = 6;
	else if (t >= 9 && t <= 10) abs_hspeed = 6.5;
	else if (t >= 11 && t <= 12) abs_hspeed = 7;
	else if (t >= 13) abs_hspeed = 7.5;
	
	abs_hspeed = min(abs_hspeed, abs_hspeed_max);
	h_speed = abs_hspeed * dir;

	if (t >= 6) animation_play("L");	
}