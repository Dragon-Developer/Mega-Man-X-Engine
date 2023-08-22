// Inherit the parent event
event_inherited();
timer = 0;
animation_add("L", keyframes_generate(5, 1/3));
animation_add_loop("L");
animation_play("L");