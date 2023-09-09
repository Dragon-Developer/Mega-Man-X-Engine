function player_saber_skills_init() {
	enum saber_skills {
		atk1,
		atk2,
		atk3,
		jump,
		normal,
		mikazukizan,
		ryuenjin,
		raikousen,
		charged_saber,
		genmu,
		length
	}
	for (var i = 0; i < saber_skills.length; i++) {
		saber_skill_boss_damage[i] = ds_map_create();
		ds_map_add(saber_skill_boss_damage[i], noone, 1);
	}

	var m;
	// Attack 3
	m = saber_skill_boss_damage[saber_skills.atk3];
	m[? noone] = 1;
	// Jump
	m = saber_skill_boss_damage[saber_skills.jump];
	m[? noone] = 2;
	// Ryuenjin
	m = saber_skill_boss_damage[saber_skills.ryuenjin];
	m[? obj_chill_penguin] = 3;
	// Mikazukizan
	m = saber_skill_boss_damage[saber_skills.mikazukizan];
	m[? noone] = 2;
	// Raikousen
	m = saber_skill_boss_damage[saber_skills.raikousen];
	m[? noone] = 2;
	m[? obj_magma_dragoon] = 3;
	// Charged
	m = saber_skill_boss_damage[saber_skills.charged_saber];
	m[? noone] = 2;
	// Genmu
	m = saber_skill_boss_damage[saber_skills.genmu];
	m[? noone] = 2;


}
