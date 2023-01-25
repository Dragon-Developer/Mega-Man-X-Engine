event_inherited();
idle_time_to_turn = 5;
intro_limit = 102;
jump_wait = 5;
whirlpool_length = 130;
whirlpool_speed = 2;
grab_move_limit = 10;
missile_speed_multiplier = { hsp: 1, vsp: 1 };
#region Animations
animation_add("idle", [
	0, 0
], 0);
animation_add("intro",
[
	0, 11,
	4, 15,
	8, 20,
	12, 7,
	28, 20,
	32, 15,
	36, 0,
	38, 2,
	44, 3,
	50, 2,
	56, 3,
	62, 2,
	78, 1,
	82, 0,
	98, 1,
	100, 5,
	102, 4
], 102);
animation_add("death", [
	0, 34
], 0);
animation_add("death_chop", [
	0, 46,
	5, 47,
	9, 48,
	14, 49,
	18, 50,
	22, 51,
	27, 52,
	30, 53
], 30);
animation_add("energy_drain",
[
	0, 35,
	8, 36,
	16, 37,
	24, 36,
	31, 36
], 0, 31);
animation_add("fall", keyframes_generate(8, 1/8,, 26));
animation_add_loop("fall");
animation_add("whirlpool", keyframes_generate(8, 1/8,, 38));
animation_add_loop("whirlpool");
animation_add("missile_1", [0, 24], 0);
animation_add("missile_2", [0, 25], 0);
animation_add("missile_3", [0, 26], 0);
animation_add("piranha", [
	0, 6,
	1, 20,
	5, 7,
	11, 20,
	15, 6,
	19, 19,
	23, 21,
	27, 18,
	31, 23,
	35, 17,
	39, 10,
	43, 8,
	47, 22,
	50, 22
]);
#endregion
#region Difficulty
damage_set(3, 5, 7);
switch (global.difficulty) {
	case diff_modes.easy:
		idle_limit = 40;
		idle_desperate_limit = 30;
		hp_desperate = 8;
		whirlpool_length = 180;
		whirlpool_speed = 1.5;
		missile_speed_multiplier = { hsp: 0.75, vsp: 0.75 };
		break;
	case diff_modes.normal:
		idle_limit = 20;
		idle_desperate_limit = 10;
		grab_move_limit = 20;
		break;
	case diff_modes.hard:
		idle_limit = 10;
		idle_desperate_limit = 5;
		hp_desperate = 32;
		whirlpool_length = 130;
		whirlpool_speed = 2;
		grab_move_limit = 30;
		missile_speed_multiplier = { hsp: 1.25, vsp: 1.25 };
		break;
}
whirlpool_length = 180;
whirlpool_speed = 1.5;
#endregion
// Specific attacks
ds_list_clear(attacks_list);
// Attack Settings
attack_properties[? boss_states.jump] = [2, 0];
attack_properties[? boss_states.dash] = [2, 0];
attack_properties[? OCTOPUS.JUMP_WHIRLPOOL] = [1/2, 1/3];
attack_properties[? OCTOPUS.JUMP_MISSILE] = [1/3, 1/3];
attack_properties[? OCTOPUS.PIRANHA] = [1/2, 1/2];
// Desperate attacks [state, chances]
shielded_states[? OCTOPUS.WHIRLPOOL] = 0;
face_x = false;
activate_collision_limit = 150;
state_set(boss_states.fall);
animation_play("fall");
grav = 0;
v_speed = 1;
jump_strength = 6.5;