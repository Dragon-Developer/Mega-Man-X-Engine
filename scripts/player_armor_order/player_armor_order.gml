function player_armor_order() {
	// Default Order
	armor_order_map[? ""] = [0, 1, 2, 3, 4, 5];
	// Sprite Specific Order
	armor_order_map[? "walk"] = [P_OG, P_HELM, P_BODY, P_ARMS, P_EXT1, P_LEGS, P_FULL];
	armor_order_map[? "saber"] = [P_OG, P_ARMS, P_HELM, P_LEGS, P_BODY, P_FULL];
	armor_order_map[? "saber_air"] = armor_order_map[? "saber"];
	armor_order_map[? "dash"] = [P_EXT1, P_OG, P_HELM, P_BODY, P_ARMS, P_LEGS, P_FULL];
	armor_order_map[? "fly"] = armor_order_map[? "dash"]
	armor_order_map[? "jump"] = armor_order_map[? "fly"]
	// Current Order
	armor_current_order = armor_order_map[? ""];


}
