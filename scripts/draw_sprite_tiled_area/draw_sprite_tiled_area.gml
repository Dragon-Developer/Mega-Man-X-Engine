/// draw_sprite_tiled_area(sprite,subimg,x,y,x1,y2,x2,y2)
function draw_sprite_tiled_area() {
	//
	/// @description  Draws a repeated sprite image, tiled to fill a given region and with
	//  a given offset. 
	//
	/// @param sprite      sprite to draw, real
	/// @param subimg      sprite subimage to draw, real
	/// @param x           origin x, real
	/// @param y           origin y, real
	/// @param x1          top-left corner x of tiled area, real
	/// @param y1          top-left corner y of tiled area, real
	/// @param x2          bottom-right corner x of tiled area, real
	/// @param y2          bottom-right corner y of tiled area, real

	/// GMLscripts.com/license

	var sprite, subimg, xx, yy, x1, y1, x2, y2;
	sprite = argument[0];
	subimg = argument[1];
	xx = argument[2];
	yy = argument[3];
	x1 = argument[4];
	y1 = argument[5];
	x2 = argument[6];
	y2 = argument[7];
 
	var sw, sh, i, j, jj, left, top, width, height, X, Y;
	sw = sprite_get_width(sprite);
	sh = sprite_get_height(sprite);
 
	i = x1 - ((x1 mod sw) - (xx mod sw)) - sw * ((x1 mod sw) < (xx mod sw));
	j = y1 - ((y1 mod sh) - (yy mod sh)) - sh * ((y1 mod sh) < (yy mod sh));
	jj = j;
 
	for (; i <= x2; i += sw) {
	    for (; j <= y2; j += sh) {
	        if (i <= x1)
				left = x1 - i;
	        else
				left = 0;
	        X = i + left;
 
	        if (j <= y1)
				top = y1 - j;
	        else
				top = 0;
	        Y = j + top;
 
	        if (x2 <= i + sw)
				width = ((sw) - (i + sw - x2) + 1) - left;
	        else
				width = sw-left;
 
	        if (y2 <= j + sh)
				height = ((sh) - (j + sh - y2) + 1) - top;
	        else
				height = sh-top;
 
	        draw_sprite_part(sprite, subimg, left, top, width, height, X, Y);
	    }
	    j = jj;
	}
	return 0;



}
