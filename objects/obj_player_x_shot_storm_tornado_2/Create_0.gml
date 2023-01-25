event_inherited();

abs_hspeed = 0;
anti_destroy = true;
anti_destroy_limit = 0;
boss_damage[? noone] = 2;
boss_damage[? obj_magma_dragoon] = 3;
lv = 4;
atk = 1;
animation_add("L", keyframes_generate(3, 1 / 2));
animation_add_loop("L"); // Set loop automatically
animation_play("L");

execute_step_in_first_frame = true;
vx = 0;
vy = 0;
vw = 0;
vh = 0;