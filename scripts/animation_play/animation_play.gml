/// @description animation_play(name,start_time)
/// @param name
/// @param start_time
var flag = false;

if (argument[0] == "")
{
	animation_end = true;
	animation = "";
	exit;
}

if (animation != argument[0])
{
	animation = argument[0];
    animation_t = 0;
	animation_frame_index = 0;
	animation_frames = animations_frames[? animation];
	animation_sprite_name = animations_sprite_name[? animation];
    animation_loop = animations_loop[? animation];
	animation_i = 0;
	animation_frame_index_start = -1;
	animation_end = false;
	flag = true;
}
if (argument_count > 1)
{
	animation_t = argument[1];
	animation_end = false;
	flag = true;
}
if (flag && array_length_1d(animation_loop))
{
	for (var i = 0; i < array_length_1d(animation_frames); i += 2)
	{
		// Loop Start Frame
		if (animation_frames[i] == animation_loop[0])
		{
			animation_frame_index_start = i;
		}
		if (animation_frames[i] == animation_t)
		{
			animation_i = animation_frames[i + 1];	
		}
			
	}
}