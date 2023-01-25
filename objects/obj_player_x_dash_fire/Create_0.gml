/// Special credits to JKB
event_inherited();
can_hit = true;
melee_activated = true;
anti_destroy = true;
anti_destroy_limit = 8;
animation_end_destroy = true;
shot_counted = false;
animation_add("S", keyframes_generate(image_number, 1/3));
animation_play("S");