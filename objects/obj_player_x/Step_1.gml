var change_armor = false;

if (keyboard_check_pressed(vk_delete))
{
	LEGS = (LEGS == "") ? "x2" : "";
	change_armor = true;
}

if (keyboard_check_pressed(vk_insert))
{
	ARMS = (ARMS == "") ? "x2" : "";
	change_armor = true;
}

if (keyboard_check_pressed(vk_home))
{
	HELM = (HELM == "") ? "x2" : "";
	change_armor = true;
}

if (keyboard_check_pressed(vk_end))
{
	BODY = (BODY == "") ? "x2" : "";
	change_armor = true;
}

if (change_armor)
{
	// Load Armor Properties
	player_load_armor(true);
}