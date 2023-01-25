/// @description Set particles to this shot
/// @param object
/// @param time_course
/// @param time_start
function player_shot_set_particles() {
	particle_object = argument[0];
	particle_time_course = argument[1];
	particle_time_start = (argument_count > 2) ? argument[2] : 0;


}
