if (charge)
{
	// Play Audio
	if (charge_level > 0 && !audio_is_playing(charge_sound))
	{
		audio_play(charge_sound);
	}
	// Get correct Charge Level/Sprite/Palette 
	for (var i = 0; i < array_length_1d(charge_limits); i++)
	{
		if (charge_t >= charge_limits[i])
		{
			if (i >= charge_level && i <= charge_level_max)
			{
				charge_level = i;
				charge_sprite = charge_sprites[i];
				charge_palette = charge_palettes[i];
			}
		}
	}
	
	if (charge_level > 0 && (charge_t > charge_limits[1]))
	{
		charge_i = (charge_i + 1) mod 22;
	}
	else
	{
		charge_i = 0;	
	}
	charge_t++;
}
else
{
	charge_i = 0;
}
// Activate Charge Blinking
if (charge_level > 0)
{
	charge_blink = (charge_t == 0 || (charge_t > charge_limits[1] + 4));
}
else
{
	charge_blink = false;	
}
// Swap Palette
if (charge_blink)
{
	if (charge_blink_t mod 4 <= 1)
	{
		plt_index = charge_palette;
	}
	else
	{
		plt_index = 0;
	}
	charge_blink_t++;
}
else
{
	charge_blink_t = 0;
	plt_index = 0;
}