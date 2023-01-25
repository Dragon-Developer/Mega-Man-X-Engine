event_inherited();
animation_add("S", keyframes_generate(4, 1));
animation_add_loop("S");
animation_play("S");
dir = choose(-1, 1)
if (dir == 1)
	sprite_index = spr_chill_penguin_snow_right;
timer = 0;
timer_limit = array_get([80, 120, 240], global.difficulty);
owner = noone;
var v = view_get_rectangle();
x = v[0];
y = v[1];
image_xscale = 320 / sprite_width;
image_yscale = 240 / sprite_height;
audio_play(snd_snow);
local_game_speed_init();