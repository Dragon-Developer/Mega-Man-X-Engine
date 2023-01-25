/// @description Step
event_inherited();
var t = timer++;

if (t == -1 && is_main) {
	var effect = instance_create_depth(x, y, depth, obj_player_x_shot_x1_effect);
	effect.owner = owner;
	effect.dir = dir;
	effect.image_xscale = dir;
	audio_play(snd_player_x_shot_x2_super);
	y_start = y;
	x_start = x;
	trail_init(10);
	depth -= 1;
}
if (t >= 0 || !shot_counted)
	visible = true;

if (t >= 5)
	abs_hspeed = 6;

if (is_main && destroy && t < 11) {
	anti_destroy = true;
}
if (is_main && (t == 8 || t == 11)) {
	var shot = instance_create_depth(x_start + 6 * dir, y_start - amplitude, depth, obj_player_x_shot_x1_super);
	shot.dir = dir;
	shot.image_xscale = dir;
	shot.shot_parent = self;
	shot.initial_phase = (1/3)*2*pi;
	if (t == 11) {
		shot.y = y_start + amplitude;
		shot.initial_phase = (2/3)*2*pi;
		anti_destroy = false;
	}
	shot.y_start = y_start;
	shot.visible = true;
	shot.timer = 5;
	with (shot) {
		animation_play("S", 5);	
	}
	ds_list_add(shots_group, shot);
	player_shot_sync_groups();
}
if (destroy)
	abs_hspeed = 0;
	
h_speed = abs_hspeed * dir;
if (abs_hspeed != 0) {
	var angle = angular_vel*(wave_timer) + initial_phase;
	//y = y_start - amplitude*sin(angle);
	v_speed = -amplitude*angular_vel*cos(angle);
	wave_timer++;
}
animation_update();
image_index = animation_i;
scr_physics_update();

if (destroy && destroy_t == 1) exit;

for(var i = 10; i > 0; i--)
{
	trail_pos[i] = trail_pos[i - 1];
	if (i == 1 && destroy) {
		trail_pos[i] = [x, y, false];
	}
}
trail_pos[0] = [x, y, visible];
