/// @description Variables
enum transition_types
{
	fade_in, // Appear from the Black
	fade_out, // Disappear into Black
	fade_out_and_fade_in,
	blink, // Blink
	transparency
}

transition_type = transition_types.fade_in;
transition_limit = 30;
timer = 0;
alpha = 0;
alpha_start = 1;
alpha_end = 1;
color = c_black;
blink_limit = 2;
auto_destroy = true;

back_sprite = noone; // Background Sprite
back_index = 0; // Image Index
back_speed = 1; // Image Speed
ds_list_add(global.transition_object_list, id);