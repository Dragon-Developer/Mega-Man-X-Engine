var val = argument[0];

// Idle
idle = false;
idle_enabled = val;

// Walk
walk = false;
walk_enabled = val;
walk_ignore_dir = false;
walk_ignore_move = false;

// Dash
dash = false;
dash_t = 0;
dash_enabled = val;
dash_tapped = false;

// Dash - Double Tap
dash_tap = false;
dash_tap_t = 0;

// Dash Up
dash_up = false;

// Dash - End
dash_end = false;
dash_end_t = 0;

// Jump
jump = false;
jump_enabled = val;

// Fall
fall = false;
fall_enabled = val;

// Land
land_enabled = val;

// Wall Slide
wall_slide = false;
wall_slide_t = 0;
wall_slide_enabled = val;

// Wall Jump
wall_jump = false;
wall_jump_t = 0;
wall_jump_enabled = val;