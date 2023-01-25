function scr_weapon_apply_damage() {
	var ene = argument[0], dmg = argument[1];
	ene.light = 1;
	ene.hp -= dmg;
	ene.hit += 1;			


}
