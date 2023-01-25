event_inherited();
idle_time_to_turn = 5;
intro_limit = 21;
jump_wait = 5;
dash_wait = 36;
hook_inst = noone;
#region Animations
animation_add("idle", [
	0, 0
], 0);
animation_add("intro", [
	0, 1,
	6, 2,
	11, 3,
	16, 4,
	21, 5
], 21);
animation_add("jump", [
	0, 7,
	5, 8
], 5);
animation_add("land", [
	0, 1,
	6, 2,
	11, 2
]);
animation_add("fall", [
	0, 9
], 0);
animation_add("dash", [
	0, 1,
	8, 3,
	20, 4,
	30, 11,
	36, 12
], 36);
animation_add("fall_attack", [
	0, 16,
	8, 15,
	15, 15
]);
animation_add("throw", [
	0, 1,
	11, 3,
	22, 4,
	33, 14,
	38, 13,
	44, 0,
	54, 0
]);
animation_add("grab", [
	0, 19,
	8, 20,
	16, 21,
	24, 22,
	53, 22
]);
animation_add("death", [
	0, 23
], 0);
animation_add("death_chop", [
	0, 24,
	4, 25,
	8, 26,
	12, 27,
	16, 28,
	20, 29,
	24, 30,
	28, 31,
	32, 32,
	50, 33
], 50);
#endregion
// Can't use these states if these objects exist
attack_object_condition[? chill_penguin.jump_to_hook] = obj_chill_penguin_wall;
// Specific attacks
ds_list_add(attacks_list,
	chill_penguin.jump_to_hook,
	chill_penguin.throw_ice
);
// Attack Settings
attack_properties[? chill_penguin.throw_ice] = [1/2, 1/3];
attack_properties[? chill_penguin.jump_to_hook] = [1/2, 1/3];
attack_properties[? chill_penguin.jump_desperate] = [1, 1/3];
#region Difficulty
damage_set(3, 5, 7);
switch (global.difficulty) {
	case diff_modes.easy:
		idle_limit = 40;
		idle_desperate_limit = 30;
		hp_desperate = 8;
		dash_speed = 7;
		break;
	case diff_modes.normal:
		idle_limit = 20;
		idle_desperate_limit = 10;
		dash_speed = 9;
		ds_list_add(attacks_list, chill_penguin.jump_desperate);
		break;
	case diff_modes.hard:
		idle_limit = 10;
		idle_desperate_limit = 5;
		hp_desperate = 32;
		max_hp = 32;
		dash_speed = 12;
		attack_limit[? boss_states.dash] = 2;
		ds_list_add(attacks_list, chill_penguin.jump_desperate);
		break;
}
#endregion
// Desperate attacks [state, chances]
ds_list_add(desperate_attacks, [chill_penguin.jump_desperate, [1/2, 1/3]]);
ds_list_add(desperate_attacks, [chill_penguin.jump_to_hook, [1/2, 1/3]]);
shielded_states[? boss_states.dash] = 30;
face_x = false;
state_set(boss_states.fall);
animation_play("fall");