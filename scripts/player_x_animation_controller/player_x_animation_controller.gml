if (animation != "")
{
	for (var i = 0; i < P_FULL; i++)
	{
		pl_sprite[i] = noone;
	
		var map1 = my_sprites[| i], map2 = my_sprites_shoot[| i];
	
		if (shoot && ds_map_exists(map2, animation))
		{
			pl_sprite[i] = map2[? animation];
		}
		else if (ds_map_exists(map1, animation))
		{
			pl_sprite[i] = map1[? animation];
		}
	}
}

animation_update();
image_index = animation_i;