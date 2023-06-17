/// @description Insert description here
// You can write your code in this editor
if (is_inside_view()) {
	instance_create_depth(x,y,depth-1,explosion_set_box);
	audio_play(exploding);
}
// Inherit the parent event
event_inherited();

