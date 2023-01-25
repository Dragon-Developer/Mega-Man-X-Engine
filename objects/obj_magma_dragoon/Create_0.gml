event_inherited();
idle_time_to_turn = 5;
intro_limit = 21;
jump_wait = 5;
dash_wait = 36;
raging_wait = 90;
hook_inst = noone;
face_x = false;
persist = true;
jump_strength = 5;
skip_complete_walk = true;
// Depths
player_depth = layer_get_depth(layer_get_id("player"));
camera_depth = layer_get_depth(layer_get_id("Camera"));
trail_init(8);
trail_sprite = spr_magma_dragoon_trail;
#region Animations
animation_add("idle", [
	0, 0
], 0);
animation_add("intro", [
	0, 4
], 0);
animation_add("intro2", [
	0, 9,
	4, 24,
	24, 16,
	27, 17,
	30, 16,
	33, 17,
	36, 16,
	39, 17,
	42, 16,
	45, 9,
	47, 0
]);
animation_add("jump_intro", [
	0, 25
], 0);
animation_add("land", [
	0, 9,
	3, 0
]);
animation_add("jump", [
	0, 20
], 0);

animation_add("fall", [
	0, 20
], 0);

// Hadouken
animation_add("hadouken1", [
	0, 5
], 0);
animation_add("hadouken2", [
	0, 6,
	2, 7
], 2);

animation_add("hadouken1_c", [
	0, 10
], 0);
animation_add("hadouken2_c", [
	0, 11,
	2, 12,
], 2);
// Shoryuken
animation_add("shoryuken1", [
	0, 4
], 0);
animation_add("shoryuken2", [
	0, 21,
	2, 22,
	4, 23
], 4);
animation_add("shoryuken_fall", [
	0, 19
], 0);
// Vomit
animation_add("vomit1", [
	0, 24
], 0);
animation_add("vomit2", [
	0, 27
], 0);
animation_add("vomit3", [
	0, 28,
	6, 28,
	7, 29
], 0, 7);
animation_add("vomit4", [
	0, 28,
	20, 27,
	23, 0
], 23);
animation_add("kick", [
	0, 18
], 0);
animation_add("flame_bullet", [
	0, 16,
	3, 17,
	5, 17
], 0, 5);
animation_add("pillar", [
	0, 13,
	2, 14,
	37, 15,
	39, 2
], 39);
animation_add("raging", [
	0, 38
], 0);
animation_add("raging2", [
	0, 22
], 0);
animation_add("raging3", [
	0, 45,
	20, 41,
	28, 40,
	36, 39,
	44, 40,
	52, 41,
	60, 42,
	68, 43,
	76, 44,
	84, 45
], 84);
// Death
animation_add("death", [
	0, 30
], 0);
animation_add("death_chop", [
	0, 31,
	5, 32,
	9, 33,
	14, 34,
	19, 35,
	25, 36,
	30, 37
], 30);
#endregion
// Can't use these states if these objects exist
attack_object_condition[? magma_dragoon.flame_pillar] = obj_magma_dragoon_pillar;
// Specific attacks
ds_list_clear(attacks_list);
// Attack Settings
attack_properties[? boss_states.jump] = [2, 0];
attack_properties[? boss_states.dash] = [2, 0];
attack_properties[? magma_dragoon.flame_bullet] = [2, 0];
attack_properties[? magma_dragoon.raging_demon] = [2, 0];
// Usable
attack_properties[? magma_dragoon.hadouken] = [1, 1/2];
attack_properties[? magma_dragoon.shoryuken] = [1, 1/3];
attack_properties[? magma_dragoon.vomit_fire] = [1, 1/3];
attack_properties[? magma_dragoon.jump_edge] = [1, 1/2];
attack_properties[? magma_dragoon.vomit_fire] = [1, 1/2];
attack_properties[? magma_dragoon.flame_pillar] = [1, 1/6];
#region Difficulty
damage_set(3, 5, 7);
switch (global.difficulty) {
	case diff_modes.easy:
		idle_limit = 30;
		idle_desperate_limit = 15;
		hp_desperate = 8;
		ds_list_add(desperate_attacks, [magma_dragoon.flame_bullet, [1, 1/4]]);
		break;
	case diff_modes.normal:
		idle_limit = 15;
		hp_desperate = 16;
		idle_desperate_limit = 5;
		ds_list_add(desperate_attacks, [magma_dragoon.flame_bullet, [1, 1/4]]);
		break;
	case diff_modes.hard:
		idle_limit = 4;
		idle_desperate_limit = 4;
		hp_desperate = 32;
		attack_properties[? magma_dragoon.flame_bullet] = [2, 0];
		ds_list_add(desperate_attacks, [magma_dragoon.flame_bullet, [1, 1/3]]);
		break;
}
#endregion
// Desperate attacks [state, chances]
ds_list_add(desperate_attacks, [magma_dragoon.raging_demon, [1, 1/2]]);
shielded_states[? magma_dragoon.flame_bullet] = 0;
//face_x = false;
state_set(magma_dragoon.jump_intro);
animation_play("jump_intro");
palette_init();
palette_texture_set(plt_magma_dragoon);
boss_effect_set(0, spr_magma_dragoon_ball);
boss_effect_set(1, spr_magma_dragoon_fire);
boss_effect_set(2, spr_magma_dragoon_shoryuken);
boss_effect_set(3, spr_magma_dragoon_shoryuken);
hitbox_inst = noone;
border_left_x = 0;
border_right_x = 0;
floor_y = 0;
floor_state = magma_dragoon.jump_edge;
stage_mid_x = 0;
activate_collision_limit = 60;