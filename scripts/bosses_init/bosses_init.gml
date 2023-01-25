#region All Bosses
enum e_boss
{
	engine,
	hq,
	chill_penguin,
	storm_eagle,
	
	flame_stag,
	magma_dragoon,
	neon_tiger,
	launch_octopus,
	intro,
	length
}
#endregion
function bosses_init() {
#region Bosses Variables
	for (var i = 0; i < e_boss.length; i++) {
		global.boss_defeated[i] = false;	
	}
	global.boss_defeated[e_boss.neon_tiger] = true;
	global.boss_defeated[e_boss.flame_stag] = true;
#endregion
#region Bosses Info
	// Needs refactoring: use struct
	// [name, boss_icon, stage_icon, room, object]
	global.boss_info[e_boss.engine] = 
	["", spr_engine_icon, -1, -1, -1];

	global.boss_info[e_boss.hq] = 
	["", spr_hq_icon, spr_stage_hq, -1, -1];

	//global.boss_info[e_boss.intro] = 
	//["", -1, -1, rm_intro_stage, -1];

	global.boss_info[e_boss.chill_penguin] = 
	["CHILL PENGUIN", spr_chill_penguin_icon, spr_stage_snow_mountain, rm_chill_penguin, obj_chill_penguin_intro];

	global.boss_info[e_boss.storm_eagle] = 
	["STORM EAGLE", spr_storm_eagle_icon, spr_7th_airborne_unit, rm_test_stage_2, obj_storm_eagle_intro];

	global.boss_info[e_boss.flame_stag] = 
	["WAIT YOU ARE NOT FLAME STAG", spr_flame_stag_icon, spr_stage_snow_mountain, rm_test_stage, obj_chill_penguin_intro];

	global.boss_info[e_boss.neon_tiger] = 
	["NEON TIGER", spr_neon_tiger_icon, -1, rm_test_slopes, obj_magma_dragoon];

	global.boss_info[e_boss.magma_dragoon] = 
	["MAGMA DRAGOON", spr_magma_dragoon_icon, -1, rm_magma_dragoon, obj_magma_dragoon_intro];
	//["MAGMA DRAGOON", spr_magma_dragoon_icon, -1, -1, obj_magma_dragoon_intro];
	
	global.boss_info[e_boss.launch_octopus] = 
	["LAUNCH OCTOPUS", spr_launch_octopus_icon, spr_launch_octopus_map, rm_launch_octopus, obj_launch_octopus_intro];
#endregion
#region Stage Select Bosses
	global.boss_slot[0] = e_boss.chill_penguin;
	global.boss_slot[1] = e_boss.storm_eagle;
	global.boss_slot[2] = e_boss.engine;
	global.boss_slot[3] = e_boss.flame_stag;
	global.boss_slot[4] = e_boss.neon_tiger;

	global.boss_slot[5] = e_boss.magma_dragoon;
	global.boss_slot[6] = noone;
	global.boss_slot[7] = e_boss.hq;
	global.boss_slot[8] = noone;
	global.boss_slot[9] = e_boss.launch_octopus;
#endregion


}
