if (animation != animation_previous)
{
	for (var i = 0; i < P_FULL; i++)
	{
		pl_sprite[i] = noone;
		var map = (!shoot ? my_sprites[| i] : my_sprites_shoot[| i]);
		
		if (ds_map_exists(map, animation))
		{
			pl_sprite[i] = map[? animation];
		}
	}
	animation_previous = animation;
}
animation_update();
image_index = animation_i;