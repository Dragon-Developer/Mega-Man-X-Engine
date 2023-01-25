function menu_get_armor_part_index() {
	switch (argument[0]) {
		case pl_btn.helmet: return P_HELM;
		case pl_btn.body: return P_BODY;
		case pl_btn.arms: return P_ARMS;
		case pl_btn.legs: return P_LEGS;
		case pl_btn.armors: return P_FULL;
	}
	return -1;


}
