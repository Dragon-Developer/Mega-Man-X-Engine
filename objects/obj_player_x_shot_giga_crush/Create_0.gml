event_inherited();

abs_hspeed = 0;
boss_damage[? noone] = 8;
shot_level = 10;
lv = 4;
atk = 32;
animation_add("S", [0, 0]);
animation_play("S");
animation_end_destroy = true;
sound = noone;

execute_step_in_first_frame = true;
vx = 0;
vy = 0;
vw = 0;
vh = 0;