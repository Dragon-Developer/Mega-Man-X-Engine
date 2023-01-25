function v_outside(argument0, argument1) {
	hb = argument0
	vb = argument1
	return (x>__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+hb || x<__view_get( e__VW.XView, 0 )-hb || y>__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+vb || y<__view_get( e__VW.YView, 0 )-vb);


}
