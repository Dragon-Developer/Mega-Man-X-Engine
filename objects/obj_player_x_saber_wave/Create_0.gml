event_inherited();
animation_add("L", keyframes_generate(4, 1 / 2));
animation_add("B",
[
	0, 4,
	1, 5,
	3, 4,
	5, 6,
	7, 7,
	9, 8,
	11, 9
]);
animation_add("D", animations_frames[? "B"]);
animation_add_loop("L");
animation_play("L");
boss_damage[? noone] = 1; // Default damage on bosses
shot_level = 2;
atk = 8; // Damage on enemies
abs_hspeed = 8; // Horizontal Speed
weapon_death_type = weapon_death_types.saber;
on_collision = function(ene) {
	if (ene.hp <= 0) return;
	var _x = ene.x;
	var _y = ene.y;
	var shot = instance_create_depth(_x, _y, depth, obj_player_x_saber_slashes);
	shot.target = ene;
	shot.dir = dir;
	shot.image_xscale = dir;
	shot.shot_parent = self;
	shot.h_speed = shot.abs_hspeed*dir;
	ds_list_add(shots_group, shot);
	player_shot_sync_groups();	
}