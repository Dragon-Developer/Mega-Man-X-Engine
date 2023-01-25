event_inherited();
abs_max_speed = 4*sqrt(2);
draw_fin = [true, true]; // Draw start/end fin
execute_step_in_first_frame = true;
sound = snd_player_axl_ray;
can_hit = false;
ray_length = 24;
inst_list = [-1, -1];
animation_add("D", [
	0, 3,
	2, 4,
	4, 5,
	5, 5
]);