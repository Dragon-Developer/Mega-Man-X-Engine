// Debug
if (keyboard_check_pressed(ord("P"))) dolor = true;

if (dolor)
{
	var t = dolor_t;
	
	if (t == 0)
	{
		my_health -= dolor_damage;
		if (wall_slide) dir = wall_slide_dir;
		player_dolor_reset(false);
		animation_play("dolor");
		audio_play(dolor_sound);
		v_speed = 0;
		grav = 0;
		blink = false;
		blink_t = 0;
		immunity = false;
		immunity_t = 0;
		visible = true;
	}
	
	if (t == 1)
	{
		if (dolor_jump) v_speed = -2;
		grav = gravity_default;
	}
	
	if (array_contains([3, 5, 7, 8, 10, 12, 14, 16, 18, 20, 21, 23, 25, 27, 29], t))
	{
		move_x(-dir);
	}
	

	if (animation == "")
	{
		dolor = false;
		dolor_t = -1;
		player_dolor_reset(true);
		
		immunity = true;
		immunity_t = 0;
		immunity_type = immunity_types.dolor;
	}
	
	dolor_t++;
}