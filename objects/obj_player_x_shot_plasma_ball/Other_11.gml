/// @description Step
event_inherited();

owner = noone;

var t = timer++;

if (t == 88)
{
	animation_play("E");	
}

if (t > 88 && animation_end)
{
	instance_destroy();
	exit;
}
