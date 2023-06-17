function macros() {
	#macro P_OG 0
	#macro P_HELM 1
	#macro P_BODY 2
	#macro P_ARMS 3
	#macro P_LEGS 4
	#macro P_FULL 5
	#macro P_EXT1 6
	#macro P_EXT2 7
	#macro P_EXT3 8
	#macro P_EXT4 9

	#macro LEGS armor[P_LEGS]
	#macro ARMS armor[P_ARMS]
	#macro BODY armor[P_BODY]
	#macro HELM armor[P_HELM]
	#macro FULL armor[P_FULL]
	#macro SHOOT_1 1
	#macro SHOOT_2 2
	#macro DOWN_LEFT 10
	#macro DOWN 12
	#macro DOWN_RIGHT 13
	#macro LEFT 14
	#macro RIGHT 16
	#macro UP_LEFT 17
	#macro UP 18
	#macro UP_RIGHT 19

	#macro BAR_DEPTH -800
	#macro G global
	#macro PAUSE if (global.paused) exit;
	#macro PAUSE_EXCEPT if (global.paused && !array_contains(pause_exceptions, global.pause_type)) exit;
	#macro PAUSE_ONLY_NORMAL if (global.paused && global.pause_type == pause_types.normal) exit;
	
	///Dialogue Engine
	#macro font_big 0
    #macro font_small 1
    #macro font_lives 2
}
