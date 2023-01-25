if (light > 0) shader_set(shader_palette_light);
var pos;
pos = trail_pos[0];
for (var i = 0; i >= pipe.image_yscale; i--) {
	draw_sprite(pipe.sprite_index, 0, pos[0], pos[1] + i*2);
}
	
draw_enemy();
pos = trail_pos[2];
switch(state)
{
	case drill.start:
		draw_sprite(spr_drillwall_drill, drill_count, pos[0], pos[1]);
		break;
	case drill.drill_up:
	case drill.drilling:
		draw_sprite(spr_drillwall_drill, 0, x, y - 15);
		break;
}
pos = trail_pos[1];
draw_sprite(spr_drillwall_base, 0, pos[0], pos[1]);
shader_reset();