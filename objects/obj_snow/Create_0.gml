animations_init();
animation_init();
animation_add("L", keyframes_generate(sprite_get_number(sprite_index), 1 / 4));
animation_add_loop("L");
animation_play("L");
local_game_speed_init();