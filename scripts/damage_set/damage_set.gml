/// @description Set Damage according to Difficulty Mode
/// @param easy
/// @param normal
/// @param hard
function damage_set() {
	collide_damage = argument[min(argument_count - 1, global.difficulty)];
}
