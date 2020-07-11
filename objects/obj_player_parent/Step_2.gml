/// @description Limit player position
x = clamp(x, limit_x[0], limit_x[1]);
if (y < limit_y) y = limit_y;