//outside=v_outside(sprite_width/2,sprite_height/2);
outside = !is_inside_view();
if (!outside && p_outside)
{
    if (!instance_exists(created))
    {
        created = instance_create_layer(x,y,layer,enemy_name);
        //set_global_message("Spawned "+object_get_name(enemy_name));
    }
}
p_outside=outside;

