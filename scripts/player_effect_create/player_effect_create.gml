var effect = argument[0];

if (!instance_exists(effect) || effect.object == noone) return noone;
var inst = instance_create_layer(x + effect.x * dir, y + effect.y, effect.layer, effect.object);

inst.dir = dir;
inst.image_xscale = dir;
inst.owner = self;
inst.xoffset = effect.x;
inst.yoffset = effect.y;

with(inst)
{
    event_perform(ev_step, ev_step_normal);
}

return inst;
