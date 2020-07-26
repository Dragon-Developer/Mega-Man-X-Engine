var draw_x = floor(x), draw_y = floor(y);

var player_inst = obj_player_x;

if (instance_exists(player_inst))
{
	if (x != xprevious && player_inst.x != player_inst.xprevious)
	{
		var dif2 = x - player_inst.x;
		draw_x = floor(player_inst.x) + dif2;
	}
}
for (var i = 0; i <= 4; i++)
{
	if (sprite_exists(pl_sprite[i]) && pl_sprite[i] != noone)
	{
		draw_sprite_ext(pl_sprite[i], image_index, draw_x, draw_y, image_xscale, 1, 0, noone, 1);
	}
}