if (immunity)
{
	var t = immunity_t;
	
	if (immunity_type == immunity_types.dolor)
	{
		blink = true;
	}
	
	if (t >= immunity_limit)
	{
		immunity = false;
		immunity_t = 0;
		blink = false;
		blink_t = 0;
		visible = true;
	}
	immunity_t++;
}

if (blink)
{
	blink_t += blink_speed;
	
	if (blink_t >= 1)
	{
		blink_t = 0;
		visible = !visible;
	}
}