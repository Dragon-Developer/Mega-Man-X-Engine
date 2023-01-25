/// @description  instance_nearest_ext(x, y, object, self_id)
/// @param x
/// @param  y
/// @param  object
/// @param  self_id
function instance_nearest_ext(argument0, argument1, argument2, argument3) {
	var obj, dis, tDis;
	obj = -4;
	dis = 1000000;
	with (argument2) if (id != argument3) {
	    tDis = point_distance(argument0, argument1, x, y);
	    if (tDis < dis) {
	        dis = tDis;
	        obj = id;
	    }
	}
	return obj;



}
