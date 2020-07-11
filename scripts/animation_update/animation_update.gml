var is_loop = false;

if (array_length_1d(animation_loop))
{
	is_loop = true;
	animation_looping(animation_loop[0], animation_loop[1]);
	
	if (animation_frame_index_start != -1)
	{
		if (animation_t == animation_loop[0])
		{
			animation_frame_index = animation_frame_index_start;
		}
	}
}
for (var i = animation_frame_index; i < array_length_1d(animation_frames); i += 2)
{
	if (animation_t >= animation_frames[i])
	{
		animation_i = animation_frames[i + 1];
		animation_frame_index = i;
		
		if (animation_t == animation_frames[i]) break;
	}
	else break;
	
	if (!is_loop && (i >= array_length_1d(animation_frames) - 2))
	{
		if (animation_t > animation_frames[i])
		{
			//animation = "";
			animation_t = -1;
			animation_frame_index = 0;
			animation_frame_index_start = -1;
			animation_frame_index_end = -1;
			animation_end = true;
			break;
		}
	}
}

image_index = animation_i;

animation_t++;
