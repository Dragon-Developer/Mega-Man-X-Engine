palette_set();

for (var i = 0; i < 5; i++)
{
	if (sprite_exists(pl_sprite[i]) && pl_sprite[i] != noone)
	{
		draw_sprite_ext(pl_sprite[i], image_index, floor(x), floor(y), image_xscale, 1, 0, noone, 1);
	}
}

shader_reset();
event_inherited();