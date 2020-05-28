var t = dash_t;
if (dash_dust.min_limit <= t && t <= dash_dust.max_limit && !dash_air)
{
    if (dash_dust.timer >= dash_dust.timer_limit) dash_dust.timer = 0;
            
    if (dash_dust.timer == 0) player_effect_create(dash_dust);
            
    dash_dust.timer++;
}
else dash_dust.timer = 0;