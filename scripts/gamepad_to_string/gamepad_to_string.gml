/// @description - Converts the given gamepad button to a string
/// @param btn
function gamepad_to_string() {
	// https://www.reddit.com/r/gamemaker/comments/55hmwg/resource_gamepad_key_essential_for_remapping/
	switch (argument[0]){
		// Constant         // Buttons Description      // Constant Number      // Type
		case gp_face1:      return "gp_face1";          // [32769]              // Button
		case gp_face2:      return "gp_face2";          // [32770]              // Button
		case gp_face3:      return "gp_face3";          // [32771]              // Button
		case gp_face4:      return "gp_face4";          // [32772]              // Button
		case gp_shoulderl:  return "gp_shoulderl";      // [32773]              // Button
		case gp_shoulderr:  return "gp_shoulderr";      // [32774]              // Button
		case gp_shoulderlb: return "gp_shoulderlb";     // [32775]              // Button
		case gp_shoulderrb: return "gp_shoulderrb";     // [32776]              // Button
		case gp_select:     return "gp_select";         // [32777]              // Button
		case gp_start:      return "gp_start";          // [32778]              // Button
		case gp_stickl:     return "gp_stickl";         // [32779]              // Button
		case gp_stickr:     return "gp_stickr";         // [32780]              // Button
		case gp_padu:       return "gp_padu";           // [32781]              // Button
		case gp_padd:       return "gp_padd";           // [32782]              // Button
		case gp_padl:       return "gp_padl";           // [32783]              // Button
		case gp_padr:       return "gp_padr";           // [32784]              // Button
		case gp_axislh:     return "gp_axislh";         // [32785]              // Analog
		case gp_axislv:     return "gp_axislv";         // [32786]              // Analog
		case gp_axisrh:     return "gp_axisrh";         // [32787]              // Analog
		case gp_axisrv:     return "gp_axisrv";         // [32788]              // Analog
		default: return "unrecognized"                          // Failsafe - EDIT: EGGCEPTION @ hypnozizziz
	}


}
