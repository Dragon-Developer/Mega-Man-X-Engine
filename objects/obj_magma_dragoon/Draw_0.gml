if (ignore_draw) exit;
// Shoryuken Layer 1
boss_effect_draw(2);
// Draw Trail
var l = array_length(trail_pos);
for (var i = l - 1; i >= 0; i -= 2) {
	var p = trail_pos[i];
	if (p[2])
		draw_sprite_ext(trail_sprite, image_index, p[0], p[1], xscale, 1, 0, c_white, (1 - (i/l)));
}
// Light Palette
if (light > 0) {
	scr_shader_set(shader_palette_light);
	if (!global.support_shaders)
		gpu_set_fog(true, c_white, 0, 0);	
} else if (plt_index != 0) {
	palette_shader();	
}
draw_enemy();
scr_shader_reset();
if (light > 0 && !global.support_shaders)
	gpu_set_fog(false, c_black, 0, 0);
// Shoryuken/Raging Layer 2
boss_effect_draw(3);
// Ball
boss_effect_draw(0);
// Fire Intro
boss_effect_draw(1);