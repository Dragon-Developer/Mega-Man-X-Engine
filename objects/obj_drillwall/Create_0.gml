event_inherited();
enum death_types {
	normal, blink	
}
face_x = false;
hp = 4;
collide_damage = 1;
hit = 0;
grav = 0;
phy_type = phy_types.NEW;
death_type = death_types.blink;
elite = 1;
persist = 1;
base_x = x;
base_y = y;
state_set(drill.wait);
pipe_y = bbox_bottom;
pipe = instance_create_depth(x - 1, y + 8, depth + 2, obj_drillwall_pipe);
pipe.owner = self;
pipe.image_yscale = -4;
trail_init(2);
trail_pos[0] = [pipe.x, pipe.y, true]; // Wall
trail_pos[1] = [base_x, base_y, true]; // Base
drill_count = 0;
drill_y = -1;
flash_count = 0;
x = x - 1;
y = y - 3;
pt = 1;

image_index_update = false;
spawn_parent = instance_nearest_ext(x, y, 77, id);

