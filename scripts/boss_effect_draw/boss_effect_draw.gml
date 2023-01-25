function boss_effect_draw() {
	var k = argument[0];
	if (anim[k])
		draw_sprite_ext(anim_sprite[k], anim_i[k], x, y, xscale, 1, 0, noone, 1);


}
