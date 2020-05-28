var _height = 1;

if (argument_count > 0) _height = abs(argument[0]);

return !place_free(x, y - _height);
