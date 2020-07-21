if (!is_on_floor()) idle = false;
if (idle && idle_enabled && is_on_floor())
{
	player_counters_reset();
	
	if (crouch_unlocked && crouch_enabled && key_down) crouch = true;
	
	if (!crouch_enabled) crouch = false;
	
	if (crouch)
	{
		var t = crouch_t++;
		
		if (key_down)
		{
			animation_play("crouch", t);
			walk_ignore_move = true;
		}
		else
		{
			if (animation == "crouch") animation_play("crouch_end", t);
			
			if (animation_end || animation != "crouch_end")
			{
				crouch = false;
				walk_ignore_move = false;
			}
		}
	}
	/*
	if (crouch_end)
	{
		var t = crouch_end_t++;
		
		if (animation_end || animation != "crouch_end")
		{
			crouch_end = false;
			crouch_end_t = 0;
		}	
	}*/
	
	if (!crouch && (animation != "land" || animation_end))
	{
		animation_play("idle");	
	}
}
else
{
	if (crouch)	walk_ignore_move = false;
	crouch = false;	
}

if (!crouch)
{
	crouch_t = 0;
}