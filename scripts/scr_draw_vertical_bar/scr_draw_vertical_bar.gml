/// @description
/// @param x
/// @param y
/// @param icon_sprite
/// @param index
/// @param amount
/// @param max_amount
/// @param unit_sprite
/// @param area_sprite
/// @param limit_sprite

var _x = argument[0], _y = argument[1];
var _icon = argument[2], _index = argument[3];
var _amount = argument[4], _max = argument[5];
var _unit = argument[6], _area = argument[7], _limit = argument[8];
var _h = sprite_get_height(_area);

// Draw Icon
draw_sprite(_icon, _index, _x, _y);

// Draw Fill Area
var yy = _y - _h;
for(var i = 0; i < _max; i++)
{
	draw_sprite(_area, 0, _x, yy);
	yy -= 2;
}

// Draw Limit Border
draw_sprite(_limit, 0, _x, yy + 1)

// Draw Units
yy = _y - _h;
for(var i = 0; i < _amount; i++)
{
	draw_sprite(_unit, 0, _x, yy);
	yy -= 2;
}