// obj_levelup_menu Create Event

global.game_paused = true;

upgrade_count = 3;
rerolls = 0;

if (!variable_global_exists("free_rerolls"))
{
    global.free_rerolls = 1;
}

upgrade_pool = [
    "firerate",
    "maxhp",
    "speed",
    "growth",
    "nutrients",
    "spawning",
    "goingdownnnn"
];

if (!Root.max_hp) {
    upgrade_pool = array_remove_string(upgrade_pool, "maxhp");
}

// pick 3 random choices
for (var i = 0; i < 3; i++) {
    choices[i] = upgrade_pool[irandom(array_length(upgrade_pool)-1)];
}