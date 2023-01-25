/// @description  calc_angle(xx_abs, _, v_sqr, g)
/// @param xx_abs
/// @param  _
/// @param  v_sqr
/// @param  g
function calc_angle(argument0, argument1, argument2, argument3) {
	var xx, yy, v, g, d, s, a;
	xx = abs(argument0);
	yy = -argument1;
	v = sqr(argument2);
	g = argument3;
	d = sqr(v) - g * (g * sqr(xx) + 2 * yy * v);
	s = sign(d);
	if (s == -1) return -1;
	if (xx == 0) return 90;
	a = arctan((v + sqrt(d)) / g / xx) / pi * 180;
	a = (a + 90) * sign(argument0) - 90;
	return (a + 360) % 360;



}
