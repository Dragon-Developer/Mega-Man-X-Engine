if (idle && idle_enabled && is_on_floor())
{
	if (crouch_unlocked && crouch_enabled && key_down) crouch = true;
	
	if (!crouch_enabled) crouch = false;
	
	if (crouch)
	{
		walk_ignore_move = true;
		
		if (key_down)
		{
			animation_play("crouch");	
		}
		else if (animation == "crouch")
		{
			animation_play("crouch_end");
		}
		
		if (animation_end)
		{
			crouch = false;
			walk_ignore_move = false;
		}
	}
	
	if (!crouch && !animation_is_playing("land"))
	{
		animation_play("idle");	
	}
}
else
{
	if (crouch)	walk_ignore_move = false;
	crouch = false;	
}