event_inherited();
lv = 4;
shot_level = 10;
atk = 5;
boss_damage[? noone] = 3;
on_collision = function(ene) {
	if (ene.hp <= 0) return;
	owner.dive_kick_jump = true;
}

abs_hspeed = 0;