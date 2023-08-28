event_inherited();
lv = 4;
atk = 2;
boss_damage[? noone] = 3;
anti_destroy = true;
anti_destroy_limit = 1;
shot_counted = false;
abs_speed = 6.5;
destroy_reset_speed = false;

animation_add("L", keyframes_generate(sprite_get_number(sprite_index), 1 / 3));
animation_play("L");
execute_step_in_first_frame = true;