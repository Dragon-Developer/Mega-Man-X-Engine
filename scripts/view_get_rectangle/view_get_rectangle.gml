function view_get_rectangle() {
	var vx = __view_get(e__VW.XView, 0);
	var vy = __view_get(e__VW.YView, 0);
	var vw = __view_get(e__VW.WView, 0);
	var vh = __view_get(e__VW.HView, 0);
	return [vx, vy, vx + vw, vy + vh];


}
